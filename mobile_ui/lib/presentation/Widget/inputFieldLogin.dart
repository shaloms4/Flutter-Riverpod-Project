import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey[600], // Darker divider
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Or continue with',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey[600], // Darker divider
          ),
        ),
      ],
    );
  }
}
