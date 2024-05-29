import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/screen/profile_edit_page.dart';
import 'package:provider/provider.dart';

class UserEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.grey[900]
            : Colors.white, // Dark background color
        margin: EdgeInsets.only(top: 10), // Increase margin from the top
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 0), // Adjust horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).getTheme ==
                            darkTheme
                        ? Colors.orange[800]
                        : Colors.purple[900], // Dark background color
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to EditProfile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileEditPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Provider.of<ThemeProvider>(context).getTheme ==
                                  darkTheme
                              ? Colors.black
                              : Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Edit profile',
                          style: TextStyle(
                            color:
                                Provider.of<ThemeProvider>(context).getTheme ==
                                        darkTheme
                                    ? Colors.black
                                    : Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
