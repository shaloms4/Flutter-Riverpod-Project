import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).getTheme == darkTheme;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded border
        boxShadow: [
          BoxShadow(
            color: isDarkTheme
                ? Colors.white.withOpacity(0.1)
                : Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        color: isDarkTheme ? Colors.grey[900] : Colors.purple[50],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isDarkTheme ? Colors.orange[800] : Colors.purple[500],
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: isDarkTheme ? Colors.black : Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John',
                        style: TextStyle(
                          color: isDarkTheme ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: isDarkTheme ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'John@gmail.com',
                        style: TextStyle(
                          color: isDarkTheme ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: isDarkTheme ? Colors.black : Colors.black,
              thickness: 1,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
