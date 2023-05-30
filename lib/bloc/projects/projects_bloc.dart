import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/helpers/save_project.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsInitial()) {
    on<GetProjectsEvent>((event, emit) async {
      emit(Loading());
      try {
        List<Project> projects = await getProjectsFromLocalStorage();
        emit(LoadingSucceed(projects));
      } catch (e) {
        emit(LoadingFailed());
      }
    });
  }
}
