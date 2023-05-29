class Task {
  String id;
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    required this.dueDate,
    this.isCompleted = false,
  });

  void complete() {
    isCompleted = true;
  }

  void uncomplete() {
    isCompleted = false;
  }

  void updateTitle(String newTitle) {
    title = newTitle;
  }

  void updateDescription(String newDescription) {
    description = newDescription;
  }

  void updateDueDate(DateTime newDueDate) {
    dueDate = newDueDate;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      isCompleted: map['isCompleted'],
    );
  }

  @override
  String toString() {
    return 'Task: $title\nDescription: $description\nDue Date: $dueDate\nCompleted: $isCompleted';
  }
}
