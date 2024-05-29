import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

Widget extraText(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/registration');
    },
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        children: [
          TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.purple[900],
              )),
          TextSpan(
            text: "Register now!",
            style: TextStyle(
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.orange
                  : Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    ),
  );
}
