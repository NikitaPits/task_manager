import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/UI/create_item_card.dart';
import 'package:task_manager/bloc/project_details/project_details_bloc.dart';
import 'package:task_manager/pages/project_details_page/local_widgets.dart/story_card.dart';
import 'package:task_manager/theme/custom_colors.dart';

class StoryPage extends StatefulWidget {
  final String projectId;

  const StoryPage({Key? key, required this.projectId}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    context.read<ProjectDetailsBloc>().add(LoadProjectEvent(widget.projectId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Text('Project Details'),
      ),
      body: BlocBuilder<ProjectDetailsBloc, ProjectDetailsState>(
        builder: (context, state) {
          if (state is ProjectLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.selectedProject.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Total Time Spent: ${state.selectedProject.spentTime}',
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
                        ...state.selectedProject.stories
                            .map((story) => StoryCard(story: story))
                            .toList(),
                        CreateItemPopUp(
                          title: 'Add a task',
                          onCreate: onCreateTask,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ProjectIsLoading) {
            return Container();
          } else if (state is ProjectLoadingFailed) {
            return const Center(child: Text('Something went wrong'));
          }
          return Container();
        },
      ),
    );
  }

  onCreateTask(name) {}
}
