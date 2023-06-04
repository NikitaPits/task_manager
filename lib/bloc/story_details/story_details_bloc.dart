import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/data/models/story_model.dart';

part 'story_details_event.dart';
part 'story_details_state.dart';

class StoryDetailsBloc extends Bloc<StoryDetailsEvent, StoryDetailsState> {
  StoryDetailsBloc() : super(StoryDetailsInitial()) {
    on<LoadStoryEvent>((event, emit) {
      Story selectedStory = event.project.stories
          .firstWhere((story) => story.id == event.stroyId);
      emit(StroyDetailsLoaded(selectedStory));
    });
  }
}
