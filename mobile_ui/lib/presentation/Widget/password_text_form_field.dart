import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextStyle labelStyle;
  final TextStyle textStyle;

  PasswordTextFormField({
    required this.labelText,
    this.validator,
    this.onSaved,
    this.labelStyle = const TextStyle(color: Colors.white),
    this.textStyle = const TextStyle(color: Colors.white),
  });

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      style: widget.textStyle,
      obscureText: !_isPasswordVisible,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
