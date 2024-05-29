import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/Profile_page.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:mobile_ui/presentation/Widget/useEditButton.dart';
import 'package:mobile_ui/presentation/widget/tab.dart';
import 'package:provider/provider.dart';

class UserAccount extends StatelessWidget {
  static const routeName = '/useraccount';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]
                : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.logout), // Use the logout icon here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'User Account',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.orange
                : Colors.purple,
          ),
        ),
        centerTitle: true,
        actions: [
          // Use the TorchWidget here
          TorchWidget(),
        ],
      ),
      body: Container(
        color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
            ? Colors.grey[900]
            : Colors.white, // Dark background color
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ProfileHeader(), // Add ProfileHeader widget here
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10), // Adjusted padding
              sliver: UserEditButton(), // Use dark themed row buttons
            ),
            SliverFillRemaining(
              child: GetTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
