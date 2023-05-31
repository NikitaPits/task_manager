import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/pages/projects_page/project_details_page/project_details_page.dart';
import 'package:task_manager/theme/custom_colors.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int taskCount = 0;
    int completedTasks = 0;
    int storyCount = project.stories.length;

    for (var sprint in project.stories) {
      taskCount += sprint.tasks.length;
      for (var task in sprint.tasks) {
        if (task.isCompleted) {
          completedTasks++;
        }
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProjectDetailsPage(project: project);
        }));
      },
      child: Card(
        color: CustomColors.widgetsBgColor,
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                project.name,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6.0),
              Text(
                'Story Count: $storyCount',
                style: const TextStyle(
                    fontSize: 14.0, color: CustomColors.subTextColor),
              ),
              const SizedBox(height: 6.0),
              Text(
                'Task Count: $completedTasks/$taskCount',
                style: const TextStyle(
                    fontSize: 14.0, color: CustomColors.subTextColor),
              ),
              const SizedBox(height: 6.0),
              Text(
                'Time Spent: ${project.spentTime}',
                style: const TextStyle(
                    fontSize: 14.0, color: CustomColors.subTextColor),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Project'),
                        content: const Text(
                            'Are you sure you want to delete this project?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ProjectsBloc>()
                                  .add(DeleteProjectEvent(project.id));
                              Navigator.of(context).pop();
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Delete Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
