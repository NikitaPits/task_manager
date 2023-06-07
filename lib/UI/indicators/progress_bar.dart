import 'package:flutter/material.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/data/models/story_model.dart';
import 'package:task_manager/theme/custom_colors.dart';

class ProgressBar extends StatelessWidget {
  final dynamic data;

  const ProgressBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int completedTasks = 0;
    int totalTasks = 0;

    if (data is Project) {
      Project project = data;
      for (var story in project.stories) {
        completedTasks += story.tasks.where((task) => task.isCompleted).length;
        totalTasks += story.tasks.length;
      }
    } else if (data is Story) {
      Story story = data;
      completedTasks = story.tasks.where((task) => task.isCompleted).length;
      totalTasks = story.tasks.length;
    }

    double progress = totalTasks != 0 ? completedTasks / totalTasks : 0.0;

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Completed $completedTasks/$totalTasks tasks',
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: CustomColors.appBarColor),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: CustomColors.bottomAppBarColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
