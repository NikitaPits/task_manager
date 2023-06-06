import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/data/models/story_model.dart';
import 'package:task_manager/data/models/task_model.dart';

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
          List<dynamic> taskList = story['tasks'] ?? [];
          List<Task> tasks = taskList.map((task) {
            return Task(
              title: task['title'],
              isCompleted: task['isCompleted'],
              id: task['id'],
            );
          }).toList();
          return Story(
            id: story['id'],
            name: story['name'],
            tasks: tasks,
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
          'tasks': story.tasks.map((task) => task.toMap()).toList(),
        };
      }).toList(),
      'spentTime': project.spentTime,
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
  log(savedProjects.toString());
  Project? foundProject;

  for (Project project in savedProjects) {
    if (project.id == projectId) {
      foundProject = project;
      break;
    }
  }

  return foundProject;
}
