import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/data.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:mobile_ui/presentation/Widget/usercard.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Page',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.orange
                : Colors.purple,
          ),
        ),
        backgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]
                : Colors.white,
        iconTheme: IconThemeData(
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.orange[800]
              : Colors.purple[200],
        ),
        actions: [
          TorchWidget(),
        ],
      ),
      body: Container(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.grey[900]
            : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 120, // Increased height for the container
                width: 120, // Increased width for the container
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[900]!, // Border color
                    width: 2.0, // Border width
                  ),
                  color:
                      Provider.of<ThemeProvider>(context).getTheme == darkTheme
                          ? Colors.grey[800]
                          : Colors.white, // White background in light mode
                ),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Provider.of<ThemeProvider>(context).getTheme ==
                              darkTheme
                          ? Colors.grey[900]
                          : Colors.white, // White background in light mode
                    ),
                    child: Icon(
                      Icons.manage_accounts_rounded,
                      size: 80, // Increased icon size
                      color: Provider.of<ThemeProvider>(context).getTheme ==
                              darkTheme
                          ? Colors.orange[800]
                          : Colors.purple[900],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    user: users[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
