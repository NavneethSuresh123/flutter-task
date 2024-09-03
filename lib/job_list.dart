import 'package:flutter/material.dart';

class JobList extends StatelessWidget {
  const JobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: List.generate(10, (index) {
          return ListTile(
            title: const Text('Jr. Java Programmer'),
            subtitle: const Text('CRTD Technologies'),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('Apply Now'),
            ),
          );
        }),
      ),
    );
  }
}
