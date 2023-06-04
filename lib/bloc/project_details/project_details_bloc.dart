import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/helpers/manage_projects.dart';

part 'project_details_event.dart';
part 'project_details_state.dart';

class ProjectDetailsBloc
    extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  ProjectDetailsBloc() : super(ProjectDetailsInitial()) {
    on<LoadProjectEvent>((event, emit) async {
      emit(ProjectIsLoading());
      try {
        Project? project = await getProjectById(event.projectId);
        log(project.toString());
        if (project != null) {
          emit(ProjectLoaded(project));
        } else {
          emit(ProjectLoadingFailed());
        }
      } catch (e) {
        log('LoadProjectEvent error: ${e.toString()}');
        emit(ProjectLoadingFailed());
      }
    });
    on<UpdateProjectDetails>((event, emit) async {
      try {
        emit(ProjectUpdating());
        await updateProjectById(event.project.id, event.project);
        emit(ProjectIsLoading());
        Project? project = await getProjectById(event.project.id);
        if (project != null) {
          emit(ProjectLoaded(project));
        } else {
          emit(ProjectLoadingFailed());
        }
      } catch (e) {
        emit(ProjectLoadingFailed());
      }
    });
  }
}
