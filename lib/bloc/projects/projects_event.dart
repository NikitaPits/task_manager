part of 'projects_bloc.dart';

@immutable
abstract class ProjectsEvent {}

class GetProjectsEvent extends ProjectsEvent {}

class UpdateProject extends ProjectsEvent {
  final Project project;

  UpdateProject(this.project);
}

class DeleteProjectEvent extends ProjectsEvent {
  final String projectId;

  DeleteProjectEvent(this.projectId);
}
