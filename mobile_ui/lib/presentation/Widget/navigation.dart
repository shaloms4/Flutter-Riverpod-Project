import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/screen/Employee_Page.dart';
import 'package:mobile_ui/presentation/screen/Jobs_Page.dart';
import 'package:mobile_ui/presentation/screen/job_create_page.dart';
import 'package:mobile_ui/presentation/screen/user.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class NavigationButtom extends StatefulWidget {
  const NavigationButtom({Key? key});

  @override
  State<NavigationButtom> createState() => _NavigationButtomState();
}

class _NavigationButtomState extends State<NavigationButtom> {
  int _page = 0;
  final List<String> _routeNames = [
    '/employee',
    '/jobs',
    '/createJob',
    '/userprofile',
  ];
  List<Widget> _pages = [
    Employee(),
    Jobs(),
    JobCreatePage(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]!
                : Colors.white,
        buttonBackgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.orange
                : Colors.purple,
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.black // Dark mode icon color
            : Colors.purple[50]!, // Light mode icon color
        animationDuration: const Duration(milliseconds: 300),
        index: _page.clamp(0, 3),
        items: <Widget>[
          Icon(
            Icons.person,
            size: 26,
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.white
                : Colors.black,
          ),
          Icon(Icons.work,
              size: 26,
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.white
                  : Colors.black),
          Icon(Icons.add,
              size: 26,
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.white
                  : Colors.black),
          Icon(Icons.account_circle,
              size: 26,
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.white
                  : Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pages[_page],
    );
  }
}
