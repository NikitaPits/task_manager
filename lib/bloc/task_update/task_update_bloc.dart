import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_update_event.dart';
part 'task_update_state.dart';

class TaskUpdateBloc extends Bloc<TaskUpdateEvent, TaskUpdateState> {
  TaskUpdateBloc() : super(TaskUpdateInitial()) {
    on<TaskUpdateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
