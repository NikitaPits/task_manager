part of 'projects_bloc.dart';

@immutable
abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class Loading extends ProjectsState {}

class LoadingFailed extends ProjectsState {}

class ProjectUpdating extends ProjectsState {}

class ProjectUpdated extends ProjectsState {
  final Project project;

  ProjectUpdated(this.project);
}

class LoadingSucceed extends ProjectsState {
  final List<Project> projects;

  LoadingSucceed(this.projects);
}
