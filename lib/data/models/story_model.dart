import 'package:task_manager/data/models/task_model.dart';

class Story {
  String id;
  String name;
  List<Task> tasks;
  double? timeSpent;

  Story({
    required this.id,
    required this.name,
    this.tasks = const [],
    this.timeSpent = 0,
  });

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    tasks.remove(task);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks.map((task) => task.toMap()).toList(),
      'timeSpent': timeSpent,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'],
      name: map['name'],
      tasks: List<Task>.from(
          map['tasks']?.map((task) => Task.fromMap(task)) ?? []),
      timeSpent: map['timeSpent'],
    );
  }

  @override
  String toString() {
    String taskList = tasks.map((task) => '- ${task.title}').join('\n');
    return 'Story ID: $id\nName: $name\nTasks:\n$taskList\nTime Spent: $timeSpent';
  }
}
