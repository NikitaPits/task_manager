import 'package:flutter/material.dart';
import 'package:task_manager/data/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              project.name,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Time Spent: ${project.spentTime}',
              style: const TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
