part of 'story_details_bloc.dart';

@immutable
abstract class StoryDetailsEvent {}

class LoadStoryEvent extends StoryDetailsEvent {
  final String stroyId;
  final Project project;

  LoadStoryEvent(this.stroyId, this.project);
}
