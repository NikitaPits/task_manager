import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/project_details/project_details_bloc.dart';
import 'package:task_manager/data/models/story_model.dart';
import 'package:task_manager/pages/story_page/story_page.dart';
import 'package:task_manager/theme/custom_colors.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int taskCount = story.tasks.length;
    int completedTasks = story.tasks.where((task) => task.isCompleted).length;

    return GestureDetector(
      onTap: () {
        dynamic state = context.read<ProjectDetailsBloc>().state;
        if (state is ProjectLoaded) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return StoryPage(stroyId: story.id, project: state.selectedProject);
          }));
        }
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: CustomColors.storyCardBg,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1.0,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              story.name,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Task Count: $completedTasks/$taskCount',
              style: const TextStyle(
                  fontSize: 14.0, color: CustomColors.subTextColor),
            ),
            const SizedBox(height: 6.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.deleteButtonColor,
                foregroundColor: CustomColors.red,
              ),
              child: const Text(
                'Close Story',
                style: TextStyle(color: CustomColors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
