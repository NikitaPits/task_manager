import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
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
        log('project.toString() ${project.toString()}');
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
    on<UpdateProjectDetailsEvent>((event, emit) async {
      try {
        emit(ProjectUpdating());

        await updateProjectById(event.project.id, event.project);
        emit(ProjectIsLoading());
        Project? project = await getProjectById(event.project.id);
        log('project ${project?.stories[0].tasks.first.isCompleted.toString()}');
        log('project ${project?.stories[0].tasks.first.id.toString()}');
        if (project != null) {
          emit(ProjectLoaded(project));
          if (event.mounted) {
            event.context.read<ProjectsBloc>().add(GetProjectsEvent());
          }
        } else {
          emit(ProjectLoadingFailed());
        }
      } catch (e) {
        log('UpdateProjectDetailsEvent ${e.toString()}');
        emit(ProjectLoadingFailed());
      }
    });
  }
}
