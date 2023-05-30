import 'package:flutter/material.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/pages/projects_page/project_details_page/local_widgets.dart/add_story_card.dart';
import 'package:task_manager/theme/custom_colors.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Text('Project Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Total Time Spent: ${project.spentTime}',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Stories:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: project.stories.length + 1,
                itemBuilder: (context, index) {
                  if (index < project.stories.length) {
                    final story = project.stories[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Story ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: story.tasks.length,
                          itemBuilder: (context, taskIndex) {
                            final task = story.tasks[taskIndex];
                            return ListTile(
                              title: Text(task.title),
                              subtitle: Text(
                                'Time Spent: ${task.spentTime}',
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    );
                  } else {
                    return AddStoryCard(
                      onStoryAdded: (story) {
                        // Обработчик добавления истории
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
