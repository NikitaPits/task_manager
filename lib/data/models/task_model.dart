class Task {
  String id;
  String title;
  String? description;
  // DateTime dueDate;
  bool isCompleted;
  double? spentTime;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    // required this.dueDate,
    this.isCompleted = false,
    this.spentTime = 0,
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

  // void updateDueDate(DateTime newDueDate) {
  //   dueDate = newDueDate;
  // }

  void updateSpentTime(double newSpentTime) {
    spentTime = newSpentTime;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      // 'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted,
      'spentTime': spentTime,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      // dueDate: DateTime.parse(map['dueDate']),
      isCompleted: map['isCompleted'],
      spentTime: map['spentTime'],
    );
  }

  // String toString() {
  //   return 'Task: $title\nDescription: $description\nDue Date: $dueDate\nCompleted: $isCompleted\nSpent Time: $spentTime hours';
  // }
}
