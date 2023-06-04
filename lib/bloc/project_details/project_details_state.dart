part of 'project_details_bloc.dart';

@immutable
abstract class ProjectDetailsState {}

class ProjectDetailsInitial extends ProjectDetailsState {}

class ProjectIsLoading extends ProjectDetailsState {}

class ProjectLoadingFailed extends ProjectDetailsState {}

class ProjectLoaded extends ProjectDetailsState {
  final Project selectedProject;

  ProjectLoaded(this.selectedProject);
}

class ProjectUpdating extends ProjectDetailsState {}
