import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/AuthButtons.dart';
import 'package:mobile_ui/presentation/Widget/extra_text.dart';
import 'package:mobile_ui/presentation/Widget/icon.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart'; // Import ThemeProvider
import 'package:mobile_ui/presentation/Widget/themes.dart'; // Import your themes
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:provider/provider.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
          ? Colors.grey[900] // Dark mode background color
          : Colors.white, // Light mode background color
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor:
              Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.grey[900]
                  : Colors.white,
          actions: [
            TorchWidget(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                adminicon(),
                const SizedBox(height: 50),
                _inputField("Username", usernameController),
                const SizedBox(height: 20),
                _inputField("Password", passwordController, isPassword: true),
                const SizedBox(height: 50),
                AdminLoginButton(),
                const SizedBox(height: 20),
                extraText(context), // Pass the context argument here
                SizedBox(height: 20), // Added space
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.white // White border color in dark mode
            : Colors.black, // Grey border color in light mode
      ),
    );

    return TextField(
      style: TextStyle(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.white // White text color in dark mode
            : Colors.black, // Black text color in light mode
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.grey[400] // Light grey hint text color in dark mode
              : Colors.black, // Grey hint text color in light mode
        ),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }
}
