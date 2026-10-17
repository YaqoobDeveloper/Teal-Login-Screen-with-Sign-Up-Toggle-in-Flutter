import 'package:flutter/material.dart';

import 'pill_field.dart';

/// [PillField] with a lock icon and an eye button that shows / hides the
/// password.
class PillPasswordField extends StatefulWidget {
  const PillPasswordField({
    super.key,
    required this.controller,
    this.hint = 'Password',
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  @override
  State<PillPasswordField> createState() => _PillPasswordFieldState();
}

class _PillPasswordFieldState extends State<PillPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return PillField(
      controller: widget.controller,
      icon: Icons.lock_outline_rounded,
      hint: widget.hint,
      obscureText: _obscure,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      onSubmitted: widget.onSubmitted,
      validator: widget.validator,
      suffix: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: IconButton(
          tooltip: _obscure ? 'Show password' : 'Hide password',
          onPressed: () => setState(() => _obscure = !_obscure),
          icon: Icon(
            _obscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
          ),
        ),
      ),
    );
  }
}
