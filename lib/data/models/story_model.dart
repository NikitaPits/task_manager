import 'package:task_manager/data/models/task_model.dart';

class Story {
  final String id;
  final String name;
  final List<Task> tasks;
  final double? timeSpent;

  Story({
    required this.id,
    required this.name,
    this.tasks = const [],
    this.timeSpent = 0,
  });
  Story copyWith({
    String? id,
    String? name,
    List<Task>? tasks,
    double? timeSpent,
  }) {
    return Story(
      id: id ?? this.id,
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
      timeSpent: timeSpent ?? this.timeSpent,
    );
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    tasks.remove(task);
  }

  @override
  String toString() {
    String taskList = tasks.map((task) => '- ${task.title}').join('\n');
    return 'Story ID: $id\nName: $name\nTasks:\n$taskList\nTime Spent: $timeSpent';
  }
}
