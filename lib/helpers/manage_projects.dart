import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/data/models/story_model.dart';

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
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String projectsJson = prefs.getString('projects') ?? '';
    if (projectsJson.isNotEmpty) {
      List<dynamic> projectList = jsonDecode(projectsJson);

      List<Project> projects = projectList.map((project) {
        List<dynamic> storyList = project['stories'] ?? [];
        List<Story> stories = storyList.map((story) {
          return Story(
            id: story['id'],
            name: story['name'],
            // Add other story fields here
          );
        }).toList();

        return Project(
          id: project['id'],
          name: project['name'],
          stories: stories,
          spentTime: project['spentTime'] ?? 0,
          // Add other project fields here
        );
      }).toList();
      return projects;
    } else {
      return [];
    }
  } catch (e) {
    log(e.toString());
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
      'stories': project.stories.map((story) {
        return {
          'id': story.id,
          'name': story.name,
          // Add other story fields here
        };
      }).toList(),
      'spentTime': project.spentTime,
      // Add other project fields here
    };
  }).toList();

  String projectsJson = jsonEncode(projectList);
  await prefs.setString('projects', projectsJson);
}

Future<void> deleteProjectById(String projectId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Project> savedProjects = await getProjectsFromLocalStorage();

  savedProjects.removeWhere((project) => project.id == projectId);

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

Future<Project?> getProjectById(String projectId) async {
  List<Project> savedProjects = await getProjectsFromLocalStorage();

  Project? foundProject;

  for (Project project in savedProjects) {
    if (project.id == projectId) {
      foundProject = project;
      break;
    }
  }

  return foundProject;
}
