part of 'story_details_bloc.dart';

@immutable
abstract class StoryDetailsEvent {}

class LoadStoryEvent extends StoryDetailsEvent {
  final String stroyId;

  LoadStoryEvent(this.stroyId);
}

class UpdateProjectDetailsEvent extends StoryDetailsEvent {
  final Project project;
  final BuildContext context;
  final bool mounted;

  UpdateProjectDetailsEvent(this.project, this.context, this.mounted);
}
