import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Top-of-screen colour wash: [left] to [right] across, fading down into
/// [background].
///
/// Built from a small bitmap that is stretched to fit, not a gradient
/// shader. Flutter's iOS renderer dithers gradients with a checkerboard
/// pattern, which shows up as visible dots on dark, low-contrast colours.
/// A stretched bitmap blends smoothly without that pattern.
class TopGlow extends StatefulWidget {
  const TopGlow({
    super.key,
    required this.left,
    required this.right,
    required this.background,
    this.solidUntil = 0.2,
  });

  final Color left;
  final Color right;
  final Color background;

  /// Fraction of the height that keeps the full left-to-right colours
  /// before fading into [background].
  final double solidUntil;

  @override
  State<TopGlow> createState() => _TopGlowState();
}

class _TopGlowState extends State<TopGlow> {
  static const _size = 64;

  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _build();
  }

  @override
  void didUpdateWidget(TopGlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.left != widget.left ||
        oldWidget.right != widget.right ||
        oldWidget.background != widget.background ||
        oldWidget.solidUntil != widget.solidUntil) {
      _build();
    }
  }

  void _build() {
    final pixels = Uint8List(_size * _size * 4);
    for (var y = 0; y < _size; y++) {
      final v = y / (_size - 1);
      final fade = ((v - widget.solidUntil) / (1 - widget.solidUntil)).clamp(
        0.0,
        1.0,
      );
      for (var x = 0; x < _size; x++) {
        final across = Color.lerp(widget.left, widget.right, x / (_size - 1))!;
        final c = Color.lerp(across, widget.background, fade)!;
        final i = (y * _size + x) * 4;
        pixels[i] = (c.r * 255).round();
        pixels[i + 1] = (c.g * 255).round();
        pixels[i + 2] = (c.b * 255).round();
        pixels[i + 3] = 255;
      }
    }
    ui.decodeImageFromPixels(pixels, _size, _size, ui.PixelFormat.rgba8888, (
      image,
    ) {
      if (!mounted) {
        image.dispose();
        return;
      }
      setState(() {
        _image?.dispose();
        _image = image;
      });
    });
  }

  @override
  void dispose() {
    _image?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = _image;
    if (image == null) return ColoredBox(color: widget.background);
    // Bilinear filtering blends between the bitmap's pixels as it stretches.
    return RawImage(
      image: image,
      fit: BoxFit.fill,
      filterQuality: FilterQuality.low,
    );
  }
}
