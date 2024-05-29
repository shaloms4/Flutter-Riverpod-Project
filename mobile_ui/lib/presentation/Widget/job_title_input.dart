import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class JobTitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Job Title',
        filled: true,
        fillColor: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? null
            : Colors.purple[50],
        border: OutlineInputBorder(),
      ),
    );
  }
}
