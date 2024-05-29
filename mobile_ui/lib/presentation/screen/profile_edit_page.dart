// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/custom_text_form_field.dart';
import 'package:mobile_ui/presentation/Widget/profile_avatar.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _name;
  String? _email;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Add this line
        title: Text(
          'EDIT PROFILE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.orange
                : Colors.purple, // Changed text color to purple
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),

        centerTitle: true,
        backgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]
                : Colors.white, // Set AppBar background color based on theme
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]
                : Colors.white,
            height: 1,
          ),
        ),
        actions: [
          TorchWidget(),
        ],

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.white
              : Colors.black,
        ),
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).getTheme == darkTheme
          ? Colors.grey[900]
          : Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ProfileAvatar(),
                SizedBox(height: 20.0),
                CustomTextFormField(
                  labelText: 'First Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) => _firstName = value,
                ),
                CustomTextFormField(
                  labelText: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) => _lastName = value,
                ),
                CustomTextFormField(
                  labelText: 'Username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                  suffixIcon: Tooltip(
                    message: 'Username can be changed once a month',
                    child: Icon(
                      Icons.info_outline,
                      color: Provider.of<ThemeProvider>(context).getTheme ==
                              darkTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                CustomTextFormField(
                  labelText: 'Phone Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phoneNumber = value,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      // Call a function to update the user's profile with _name, _email, _phoneNumber
                      // You can also show a confirmation dialog or snackbar here
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).getTheme ==
                              darkTheme
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color?>((states) {
                      return Provider.of<ThemeProvider>(context).getTheme ==
                              darkTheme
                          ? Colors.orange[800]
                          : Colors.purple[900];
                    }),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Logic to logout
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Provider.of<ThemeProvider>(context).getTheme ==
                                  darkTheme
                              ? Colors.orange[800]
                              : Colors.purple[900],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Logic to delete the account
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Account'),
                              content: Text(
                                  'Are you sure you want to delete your account? This action cannot be undone.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Logic to delete the account permanently
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Delete'),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color?>((states) {
                                      return Provider.of<ThemeProvider>(context)
                                                  .getTheme ==
                                              darkTheme
                                          ? Colors.orange[800]
                                          : Colors.purple[900];
                                    }),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                            color:
                                Provider.of<ThemeProvider>(context).getTheme ==
                                        darkTheme
                                    ? Colors.orange[800]
                                    : Colors.purple[900]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
