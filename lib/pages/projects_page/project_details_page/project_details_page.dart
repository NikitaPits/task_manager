import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/pages/projects_page/project_details_page/local_widgets.dart/add_story_card.dart';
import 'package:task_manager/pages/projects_page/project_details_page/local_widgets.dart/story_card.dart';
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
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  ...project.stories
                      .map((story) => StoryCard(story: story))
                      .toList(),
                  AddStoryCard(
                    onStoryAdded: (story) {
                      context.read<ProjectsBloc>().add(UpdateProject(project
                          .copyWith(stories: [...project.stories, story])));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
