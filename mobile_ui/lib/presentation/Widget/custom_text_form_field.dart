import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final TextStyle? labelStyle; // Changed to nullable
  final TextStyle? textStyle; // Changed to nullable

  CustomTextFormField({
    required this.labelText,
    this.validator,
    this.onSaved,
    this.labelStyle, // Removed default value
    this.textStyle, // Removed default value
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = themeProvider.getTheme == darkTheme;

    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ??
            TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
        suffixIcon: suffixIcon,
      ),
      style: textStyle ??
          TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
