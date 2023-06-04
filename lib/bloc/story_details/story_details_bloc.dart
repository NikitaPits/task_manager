import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/project_model.dart';

part 'story_details_event.dart';
part 'story_details_state.dart';

class StoryDetailsBloc extends Bloc<StoryDetailsEvent, StoryDetailsState> {
  StoryDetailsBloc() : super(StoryDetailsInitial()) {
    on<StoryDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
