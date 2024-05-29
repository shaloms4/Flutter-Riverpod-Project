import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class JobCard extends StatefulWidget {
  final String name;
  final String description;
  final String title;
  final String phoneNumber;
  final int startingSalary;
  final String address;
  final bool isEmployee;

  JobCard({
    required this.name,
    required this.description,
    required this.title,
    required this.phoneNumber,
    required this.startingSalary,
    required this.address,
    required this.isEmployee,
  });

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool showReviews = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
              ? Colors.black87
              : Colors.purple[50],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    if (widget.isEmployee)
                      Icon(
                        Icons.person,
                        color: Provider.of<ThemeProvider>(context).getTheme ==
                                darkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                    if (!widget.isEmployee)
                      Icon(
                        Icons.work,
                        color: Provider.of<ThemeProvider>(context).getTheme ==
                                darkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                    Text(
                      ' ${widget.title}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Provider.of<ThemeProvider>(context).getTheme ==
                                darkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.rate_review,
                        color: Provider.of<ThemeProvider>(context).getTheme ==
                                darkTheme
                            ? Colors.white
                            : Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          showReviews = !showReviews;
                        });
                      },
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Provider.of<ThemeProvider>(context).getTheme ==
                                  darkTheme
                              ? Colors.orange[800]!
                              : Colors.purple[800]!,
                          Provider.of<ThemeProvider>(context).getTheme ==
                                  darkTheme
                              ? Colors.orange[800]!
                              : Colors.purple[800]!,
                          Provider.of<ThemeProvider>(context).getTheme ==
                                  darkTheme
                              ? Colors.orange[800]!
                              : Colors.purple[800]!,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SizedBox(height: 4),
            Text(
              'By: ${widget.name}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Phone Number: ${widget.phoneNumber}',
              style: TextStyle(
                fontSize: 14,
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Starting Salary: ${widget.startingSalary}',
              style: TextStyle(
                fontSize: 14,
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${widget.description}',
              style: TextStyle(
                fontSize: 14,
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Address: ${widget.address}',
              style: TextStyle(
                fontSize: 14,
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            if (showReviews) ReviewSection(),
          ],
        ),
      ),
    );
  }
}

class ReviewSection extends StatefulWidget {
  @override
  _ReviewSectionState createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Text(
          'No reviews yet',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.white
                : Colors.purple,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(
                  color:
                      Provider.of<ThemeProvider>(context).getTheme == darkTheme
                          ? Colors.white
                          : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Write your review...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(),
                  fillColor:
                      Provider.of<ThemeProvider>(context).getTheme == darkTheme
                          ? Colors.grey[800]
                          : Colors.purple[200],
                  filled: true,
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.white
                    : Colors.purple,
              ),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Rate:',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.white
                : Colors.black,
          ),
        ),
        SizedBox(height: 4),
        _buildStarRating(),
      ],
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              setState(() {
                rating = i;
              });
            },
            child: Icon(
              i <= rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          ),
      ],
    );
  }
}
