part of 'projects_bloc.dart';

@immutable
abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class Loading extends ProjectsState {}

class LoadingFailed extends ProjectsState {}

class LoadingSucceed extends ProjectsState {
  final List<Project> projects;

  LoadingSucceed(this.projects);
}
