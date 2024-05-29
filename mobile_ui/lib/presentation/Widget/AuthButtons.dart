import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: double.infinity,
          child: Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor:
              Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.orange[800] // Orange button color in dark mode
                  : Colors.purple[900],
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).getTheme == darkTheme;
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/navigation');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: isDarkTheme
            ? Colors.orange[800] // Orange button color in dark mode
            : Colors.purple[900], // purple button color in light mode
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: isDarkTheme
                ? Colors.black // Text color in dark mode
                : Colors.white, // Text color in light mode
          ),
        ),
      ),
    );
  }
}

class AdminLoginButton extends StatelessWidget {
  const AdminLoginButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).getTheme == darkTheme;
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/adminpage');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: isDarkTheme
            ? Colors.orange[800] // Orange button color in dark mode
            : Colors.purple[900], // purple button color in light mode
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: isDarkTheme
                ? Colors.black // Text color in dark mode
                : Colors.white, // Text color in light mode
          ),
        ),
      ),
    );
  }
}
