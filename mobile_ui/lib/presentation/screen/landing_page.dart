import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/feature_card.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeProvider>(context).getTheme == darkTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: isDarkTheme
            ? null
            : LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
      child: Scaffold(
        backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.transparent,
        appBar: AppBar(
          backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.transparent,
          title: Center(
            child: Text(
              'Welcome to Job Finder!',
              style: TextStyle(
                color: isDarkTheme ? Colors.orange[800] : Colors.purple[800],
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          actions: [
            TorchWidget(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40), // Increased space here
                      Text(
                        'Discover your dream job today :)',
                        style: TextStyle(
                          fontSize: 20,
                          color: isDarkTheme
                              ? Colors.orangeAccent
                              : Colors.purple[900],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 60),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          FeatureCard(
                            iconData: Icons.work,
                            title: 'Jobs',
                            onTap: () {},
                          ),
                          FeatureCard(
                            iconData: Icons.message,
                            title: 'Messages',
                            onTap: () {},
                          ),
                          FeatureCard(
                            iconData: Icons.account_balance_wallet,
                            title: 'Salary',
                            onTap: () {},
                          ),
                          FeatureCard(
                            iconData: Icons.location_on,
                            title: 'Locations',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  isDarkTheme ? Colors.orange[800]! : Colors.purple[900]!,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Let\'s Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkTheme ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/adminlogin');
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkTheme ? Colors.white : Colors.purple[900],
                  ),
                  children: [
                    TextSpan(
                      text: 'Are you an admin? ',
                      style: TextStyle(
                        color: isDarkTheme ? Colors.orange : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
