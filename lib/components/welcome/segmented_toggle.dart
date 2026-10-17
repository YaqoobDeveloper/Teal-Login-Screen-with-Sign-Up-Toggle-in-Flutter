import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/welcome_colors.dart';

/// Two-option pill switch whose highlight slides to the selected side,
/// like "Sign Up | Login".
class SegmentedToggle extends StatelessWidget {
  const SegmentedToggle({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  }) : assert(options.length == 2);

  final List<String> options;
  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: WelcomeColors.track,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            alignment: selected == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: WelcomeColors.segment,
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < options.length; i++)
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => onChanged(i),
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: Text(
                          options[i],
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: i == selected
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: WelcomeColors.text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
