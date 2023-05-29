import 'package:task_manager/data/models/task_model.dart';

class Story {
  String title;
  List<Task> tasks;

  Story({required this.title, this.tasks = const []});

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    tasks.remove(task);
  }

  @override
  String toString() {
    String taskList = tasks.map((task) => '- ${task.title}').join('\n');
    return 'Story: $title\nTasks:\n$taskList';
  }
}
