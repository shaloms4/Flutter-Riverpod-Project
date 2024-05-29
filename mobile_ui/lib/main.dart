import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/AuthButtons.dart';
import 'package:mobile_ui/presentation/Widget/User_Job.dart';
import 'package:mobile_ui/presentation/Widget/User_Review.dart';
import 'package:mobile_ui/presentation/Widget/navigation.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:mobile_ui/presentation/screen/Employee_Page.dart';
import 'package:mobile_ui/presentation/screen/Jobs_Page.dart';
import 'package:mobile_ui/presentation/screen/Login_Page.dart';
import 'package:mobile_ui/presentation/screen/Register_Page.dart';
import 'package:mobile_ui/presentation/screen/adminPage.dart';
import 'package:mobile_ui/presentation/screen/admin_login.dart';
import 'package:mobile_ui/presentation/screen/job_create_page.dart';
import 'package:mobile_ui/presentation/screen/landing_page.dart';
import 'package:mobile_ui/presentation/screen/profile_edit_page.dart';
import 'package:mobile_ui/presentation/screen/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themeBool = prefs.getBool("isDark") ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(isDark: themeBool),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'JOB HUB',
          initialRoute: '/',
          routes: {
            '/': (context) => LandingPage(),
            '/registration': (context) => RegistrationPage(),
            '/login': (context) => LoginPage(),
            '/job': (context) => Jobs(),
            '/employee': (context) => Employee(),
            '/createJob': (context) => JobCreatePage(),
            '/profileEdit': (context) => ProfileEditPage(),
            '/useprofile': (context) => UserAccount(),
            '/navigation': (context) => NavigationButtom(),
            '/uploads': (context) => Uploads(),
            '/tags': (context) => Tags(),
            '/adminlogin': (context) => AdminLoginPage(),
            '/adminpage': (context) => AdminPage(),
            '/torch': (context) => TorchWidget(),
            '/adminbutton': (context) => AdminLoginButton()
          },
          theme: themeProvider.getTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
