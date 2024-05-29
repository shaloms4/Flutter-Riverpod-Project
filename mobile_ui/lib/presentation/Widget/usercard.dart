import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/data.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
          ? Colors.black87
          : Colors.purple[50],
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(user.profilePicture),
            radius: 30,
          ),
          title: Text(
            user.name,
            style: TextStyle(
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.black87,
                fontSize: 20.0),
          ),
          subtitle: Text(
            user.email,
            style: TextStyle(
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                  ? Colors.orange[800]
                  : Colors.purple[900],
            ),
            onPressed: () {
              // Implement delete functionality here
            },
          ),
        ),
      ),
    );
  }
}
