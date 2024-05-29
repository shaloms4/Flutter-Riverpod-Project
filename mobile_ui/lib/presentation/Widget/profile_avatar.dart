import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('assets/photo1664867017 (4).jpeg'),
    );
  }
}
