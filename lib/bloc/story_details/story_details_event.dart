part of 'story_details_bloc.dart';

@immutable
abstract class StoryDetailsEvent {}

class LoadStoryEvent extends StoryDetailsEvent {
  final String stroyId;
  final Project project;

  LoadStoryEvent(this.stroyId, this.project);
}

class UpdateStoryEvent extends StoryDetailsEvent {
  final Story story;

  UpdateStoryEvent(this.story);
}
