import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class Uploads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).getTheme == darkTheme;

    return TabBarView(
      children: [
        // First tab bar view widget
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.grey[800]
                    : Colors.white, // Update background color
                borderRadius: BorderRadius.circular(60), // Circular shape
                border: Border.all(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black, // Update border color
                  width: 2, // Border width
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode
                            ? Colors.grey[800]
                            : Colors.purple[50], // Update background color
                      ),
                      child: Icon(
                        Icons.work,
                        color: isDarkMode
                            ? Colors.orange[800]
                            : Colors.purple[800], // Update icon color
                        size: 50,
                      ),
                    ),
                    Positioned.fill(
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.purple, // Update border color
                              width: 2, // Border width
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'No Jobs Posted',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: isDarkMode
                    ? Colors.white
                    : Colors.black, // Update text color
                fontSize: 20,
              ),
            ),
          ],
        ),
        // Second tab bar view widget
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.grey[800]
                    : Colors.white, // Update background color
                borderRadius: BorderRadius.circular(60), // Circular shape
                border: Border.all(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.purple, // Update border color
                  width: 2, // Border width
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode
                            ? Colors.grey[800]
                            : Colors.white, // Update background color
                      ),
                      child: Icon(
                        Icons.label,
                        color: isDarkMode
                            ? Colors.orange[800]
                            : Colors.purple[800], // Update icon color
                        size: 50,
                      ),
                    ),
                    Positioned.fill(
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.purple[500]!, // Update border color
                              width: 2, // Border width
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
