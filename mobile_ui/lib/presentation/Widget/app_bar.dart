import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black, 
      title: Text(
        'Job Finder',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true, 
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/logo.png',
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            
          },
        ),
      ],
    );
  }
}
