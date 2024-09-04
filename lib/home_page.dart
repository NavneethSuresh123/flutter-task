import 'package:flutter/material.dart';
import 'package:task/explore_hiremi.dart';
import 'package:task/task_bar.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              const ExploreHiremi(),

              const FeaturedSection(),

              const JobList(),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }
}
