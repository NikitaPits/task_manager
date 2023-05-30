import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/project_model.dart';

Future<void> saveProjectsToLocalStorage(Project project) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Project> savedProjects = await getProjectsFromLocalStorage();
  savedProjects.add(project);
  List<Map<String, dynamic>> projectList = savedProjects.map((project) {
    return {
      'id': project.id,
      'name': project.name,
      'timeSpent': project.spentTime,
    };
  }).toList();
  String projectsJson = jsonEncode(projectList);
  await prefs.setString('projects', projectsJson);
}

Future<List<Project>> getProjectsFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String projectsJson = prefs.getString('projects') ?? '';
  if (projectsJson.isNotEmpty) {
    List<dynamic> projectList = jsonDecode(projectsJson);
    List<Project> projects = projectList.map((project) {
      return Project(
        id: project['id'],
        name: project['name'],
        spentTime: project['timeSpent'],
      );
    }).toList();
    return projects;
  } else {
    return [];
  }
}

Future<void> updateProjectById(String projectId, Project updatedProject) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Project> savedProjects = await getProjectsFromLocalStorage();

  int projectIndex =
      savedProjects.indexWhere((project) => project.id == projectId);
  if (projectIndex != -1) {
    savedProjects[projectIndex] = updatedProject;
  }

  List<Map<String, dynamic>> projectList = savedProjects.map((project) {
    return {
      'id': project.id,
      'name': project.name,
      'timeSpent': project.spentTime,
    };
  }).toList();

  String projectsJson = jsonEncode(projectList);
  await prefs.setString('projects', projectsJson);
}
