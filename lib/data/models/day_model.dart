import 'package:task_manager/data/models/task_model.dart';

class Day {
  String title;
  List<Task> tasks;

  Day({required this.title, this.tasks = const []});

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTaskById(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
  }

  @override
  String toString() {
    String taskList = tasks.map((task) => '- ${task.title}').join('\n');
    return 'Day: $title\nTasks:\n$taskList';
  }
}
