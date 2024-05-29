import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/job_title_input.dart';
import 'package:mobile_ui/presentation/Widget/job_description_input.dart';
import 'package:mobile_ui/presentation/Widget/job_location_input.dart';
import 'package:mobile_ui/presentation/Widget/job_salary_input.dart';
import 'package:mobile_ui/presentation/Widget/torch.dart';
import 'package:provider/provider.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';

class JobCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'CREATE JOB',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.orange
                : Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]
                : Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.grey[700],
            height: 1,
          ),
        ),
        // Add the TorchWidget here
        actions: [
          TorchWidget(),
        ],
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).getTheme == darkTheme
          ? Colors.grey[900]
          : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            JobTitleInput(),
            SizedBox(height: 20),
            JobDescriptionInput(),
            SizedBox(height: 20),
            JobLocationInput(),
            SizedBox(height: 20),
            JobSalaryInput(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logic to submit job creation form
              },
              child: Text(
                'Create Job',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 50),
                ),
                backgroundColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  return Provider.of<ThemeProvider>(context).getTheme ==
                          darkTheme
                      ? Colors.orange[800]
                      : Colors.purple[900];
                }),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: Provider.of<ThemeProvider>(context).getTheme ==
                              darkTheme
                          ? Colors.transparent
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
