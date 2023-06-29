import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'story_update_event.dart';
part 'story_update_state.dart';

class StoryUpdateBloc extends Bloc<StoryUpdateEvent, StoryUpdateState> {
  StoryUpdateBloc() : super(StoryUpdateInitial()) {
    on<StoryUpdateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
