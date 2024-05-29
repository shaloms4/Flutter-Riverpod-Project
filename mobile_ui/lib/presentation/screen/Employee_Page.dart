import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/Job_Card.dart';
import 'package:mobile_ui/presentation/Widget/Job_Description.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:provider/provider.dart';

class Employee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Add this line
        title: Text(
          'EMPLOYEES',
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
            color: Colors.grey[700],
            height: 1,
          ),
        ),
        actions: [
          TorchWidget(),
        ],
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).getTheme == darkTheme
          ? Colors.grey[900]
          : Colors.white, // Set background color based on theme
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (final jobDescription in jobDescriptions) ...[
                  Column(
                    children: [
                      JobCard(
                        name: jobDescription.name,
                        description: jobDescription.description,
                        title: jobDescription.title,
                        phoneNumber: jobDescription.phoneNumber,
                        startingSalary: jobDescription.startingSalary,
                        address: jobDescription.address,
                        isEmployee: true,
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
