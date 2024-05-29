import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class ProfilePictureInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/download.png"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor:
                Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.orange[800] // Orange color in dark mode
                    : Colors.purple[900],
            child: Icon(
              Icons.camera_alt,
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
