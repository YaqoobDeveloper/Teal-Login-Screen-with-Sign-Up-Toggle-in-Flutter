import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/welcome_colors.dart';

/// Full-width bright mint pill button, like "Log Me In".
class MintButton extends StatelessWidget {
  const MintButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 58,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: WelcomeColors.mint,
            borderRadius: BorderRadius.circular(29),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              label,
              key: ValueKey(label),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: WelcomeColors.onMint,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
