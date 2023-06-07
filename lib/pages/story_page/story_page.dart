import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/UI/create_item_card.dart';
import 'package:task_manager/UI/indicators/progress_bar.dart';
import 'package:task_manager/bloc/project_details/project_details_bloc.dart';
import 'package:task_manager/bloc/story_details/story_details_bloc.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/data/models/story_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/pages/story_page/local_widgets.dart/task_card.dart';
import 'package:task_manager/theme/custom_colors.dart';
import 'package:uuid/uuid.dart';

class StoryPage extends StatefulWidget {
  final String stroyId;
  final Project project;

  const StoryPage({Key? key, required this.stroyId, required this.project})
      : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    context.read<StoryDetailsBloc>().add(LoadStoryEvent(
          widget.stroyId,
          widget.project,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Text('Story Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_image.png'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: BlocBuilder<StoryDetailsBloc, StoryDetailsState>(
          builder: (context, state) {
            if (state is StroyDetailsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.story.name,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: ProgressBar(
                            data: state.story,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Total Time Spent: ${state.story.timeSpent}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Tasks:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 16.0,
                            runSpacing: 16.0,
                            children: [
                              ...state.story.tasks
                                  .map((story) => TaskCard(
                                      task: story, onComplete: onCompleteTask))
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CreateItemPopUp(
                      title: 'Add a task',
                      onCreate: onCreateTask,
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
      ),
    );
  }

  onCreateTask(String name) {
    var storyState = context.read<StoryDetailsBloc>().state;
    if (storyState is StroyDetailsLoaded) {
      Story story = storyState.story;
      story.addTask(Task(
        title: name,
        id: const Uuid().v4(),
      ));

      widget.project.updateStory(story);
      context.read<StoryDetailsBloc>().add(UpdateStoryEvent(story));
      log('Tasks in project to update ${widget.project.stories.first.tasks.toString()}');
      context
          .read<ProjectDetailsBloc>()
          .add(UpdateProjectDetailsEvent(widget.project, context, mounted));
    }
    Navigator.pop(context);
  }

  onCompleteTask(Task task) {
    task.complete();
    var storyState = context.read<StoryDetailsBloc>().state;
    if (storyState is StroyDetailsLoaded) {
      Story story = storyState.story;
      story.updateTask(task);
      log(story.tasks.first.isCompleted.toString());
      log(story.tasks.first.id.toString());
      widget.project.updateStory(story);
      context.read<StoryDetailsBloc>().add(UpdateStoryEvent(story));
      context
          .read<ProjectDetailsBloc>()
          .add(UpdateProjectDetailsEvent(widget.project, context, mounted));
    }
  }
}
