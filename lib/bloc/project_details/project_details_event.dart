part of 'project_details_bloc.dart';

@immutable
abstract class ProjectDetailsEvent {}

class LoadProjectEvent extends ProjectDetailsEvent {
  final String projectId;

  LoadProjectEvent(this.projectId);
}

class UpdateProjectDetails extends ProjectDetailsEvent {
  final Project project;

  UpdateProjectDetails(this.project);
}
