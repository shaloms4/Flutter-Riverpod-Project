import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileriverpod/application/job/provider/job-riverpod_provider.dart';
import 'package:mobileriverpod/presentation/view/review/create_review.dart';
import 'package:mobileriverpod/application/user/provider/user_riverpod_provider.dart';

class JobSeekerPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobState = ref.watch(EmployeejobNotifierProvider);
    final userId = ref.watch(userIdProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(
                'Job seekers CV',
                style: TextStyle(
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Container(
                height: 1.0, // Thin line
                color: Colors.grey[700], // Dark gray color
                width: double.infinity, // Extend the line across the whole screen
              ),
            ],
          ),
        ),
      ),
      body: jobState.when(
        data: (jobs) {
          if (jobs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple[900],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No job seekers available',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.purple[900],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                await ref.read(EmployeejobNotifierProvider.notifier).getJobsForJobSeekers();
                
              },
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      color: Colors.purple[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.person, color: Colors.black), // Job icon
                            title: Text(
                              job.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ), // Title
                            trailing: IconButton(
                              icon: Icon(Icons.rate_review, color: Colors.purple[900]), // Review icon in purple[900]
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => ReviewDialog(
                                    jobId: job.jobId!,
                                    userId: userId,
                                  ),
                                );
                              },
                            ),
                          ),
                          Divider(
                            color: Colors.purple[900], // Horizontal line color set to purple[900]
                            thickness: 2.0,
                            height: 2.0,
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text('Phone Number: ${job.phonenumber}'), // Phone number
                                SizedBox(height: 4),
                                Text('Description: ${job.description}'), // Description
                                SizedBox(height: 4),
                                Text('Salary: ${job.salary}'), // Salary
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Failed to load jobs: $error'),
        ),
      ),
    );
  }
  }