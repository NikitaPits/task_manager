part of 'project_details_bloc.dart';

@immutable
abstract class ProjectDetailsEvent {}

class LoadProjectEvent extends ProjectDetailsEvent {
  final String projectId;

  LoadProjectEvent(this.projectId);
}

class UpdateProjectDetailsEvent extends ProjectDetailsEvent {
  final Project project;
  final BuildContext context;
  final bool mounted;

  UpdateProjectDetailsEvent(this.project, this.context, this.mounted);
}
