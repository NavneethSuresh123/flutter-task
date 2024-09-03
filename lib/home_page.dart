import 'package:flutter/material.dart';
import 'package:task/explore_hiremi.dart';
import 'package:task/task_bar.dart';// Ensure task_bar.dart defines AppBottomNavigationBar
import 'package:task/job_list.dart';
import 'package:task/featured_section.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiremi',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hiremi'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align all children to the start
            children: [
              // Profile Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Harsh Pawar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Verify Now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Banner Section
              const ExploreHiremi(),

              // Featured Section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Featured Section',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Job Category Buttons
              const FeaturedSection(),

              // Latest Opportunities - No individual scrolling
              const JobList(),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }
}
