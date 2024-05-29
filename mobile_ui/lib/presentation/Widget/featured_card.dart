import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class FeatureCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;

  const FeatureCard({
    required this.iconData,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).getTheme == darkTheme;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: isDarkTheme
          ? Colors.grey[800]
          : Colors.blue[300], // Remove the default color
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: isDarkTheme // Check if it's dark mode
                ? null // Don't use gradient in dark mode
                : LinearGradient(
                    // Add linear gradient in light mode
                    colors: [
                      Colors.blue[50]!,
                      Colors.blue[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDarkTheme ? Colors.grey[700] : Colors.blue[800],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  size: 40,
                  color: isDarkTheme ? Colors.orangeAccent : Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.orangeAccent : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
