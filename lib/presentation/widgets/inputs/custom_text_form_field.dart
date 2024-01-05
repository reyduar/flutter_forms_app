import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final IconData? icon;
  final Function(String)? onChanged;
  final String? Function(String?)?
      validator; // A function that vetifies the user's input and returns an error

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.icon,
    this.errorMessage,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: colors.primary,
          ),
          focusedErrorBorder:
              border.copyWith(borderSide: BorderSide(color: colors.error)),
          errorBorder:
              border.copyWith(borderSide: BorderSide(color: colors.error)),
          errorText: errorMessage,
          isDense: true),
    );
  }
}
