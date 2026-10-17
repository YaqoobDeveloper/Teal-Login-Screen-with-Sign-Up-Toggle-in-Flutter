import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/welcome_colors.dart';

/// Filled pill field with a leading icon, like "Email Address".
class PillField extends StatelessWidget {
  const PillField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(29)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      cursorColor: WelcomeColors.mint,
      style: GoogleFonts.inter(fontSize: 15, color: WelcomeColors.text),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(fontSize: 15, color: WelcomeColors.muted),
        errorStyle: GoogleFonts.inter(fontSize: 12, color: WelcomeColors.error),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: Icon(icon, size: 20),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 52),
        prefixIconColor: WelcomeColors.muted,
        suffixIcon: suffix,
        suffixIconColor: WelcomeColors.muted,
        filled: true,
        fillColor: WelcomeColors.field,
        contentPadding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border.copyWith(
          borderSide: BorderSide(
            color: WelcomeColors.mint.withValues(alpha: 0.6),
          ),
        ),
        errorBorder: _border,
        focusedErrorBorder: _border,
      ),
    );
  }
}
