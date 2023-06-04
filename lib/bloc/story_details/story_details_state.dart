part of 'story_details_bloc.dart';

@immutable
abstract class StoryDetailsState {}

class StoryDetailsInitial extends StoryDetailsState {}

class StroyDetailsLoaded extends StoryDetailsState {
  final Story story;

  StroyDetailsLoaded(this.story);
}
