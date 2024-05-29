import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/Tile.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class Customicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.white // White border color in dark mode
              : Colors.black, // Black border color in light mode
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.white // White icon color in dark mode
            : Colors.black, // Black icon color in light mode
        size: 120,
      ),
    );
  }
}

class adminicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.white // White border color in dark mode
              : Colors.black, // Black border color in light mode
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.admin_panel_settings,
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.white // White icon color in dark mode
            : Colors.black, // Black icon color in light mode
        size: 120,
      ),
    );
  }
}

// Added method for social login icons row
class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareTile(imagePath: 'assets/google.png'),
        const SizedBox(width: 25),
        SquareTile(imagePath: 'assets/apple.png'),
      ],
    );
  }
}
// Move the extraText method outside of LoginPage class
