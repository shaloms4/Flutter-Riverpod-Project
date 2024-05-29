import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/AuthButtons.dart';
import 'package:mobile_ui/presentation/Widget/profileInput.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController picController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).getTheme == darkTheme
          ? Colors.grey[900]
          : Colors.white,
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
              ProfilePictureInput(),
              const SizedBox(height: 20),
              _inputField("Email", emailController),
              const SizedBox(height: 20),
              _inputField("Username", usernameController),
              const SizedBox(height: 20),
              _inputField("First Name", firstNameController),
              const SizedBox(height: 20),
              _inputField("Last Name", lastNameController),
              const SizedBox(height: 20),
              _inputField("Password", passwordController, isPassword: true),
              const SizedBox(height: 50),
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.white // White border color in dark mode
            : Colors.black,
      ),
    );

    return TextField(
      style: TextStyle(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.white
            : Colors.black,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.white
              : Colors.black,
        ),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }
}
