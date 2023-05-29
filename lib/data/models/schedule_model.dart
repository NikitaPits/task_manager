import 'package:task_manager/data/models/day_model.dart';

class Schedule {
  List<Day> days;

  Schedule({this.days = const []});

  void addDay(Day day) {
    days.add(day);
  }

  void removeDay(Day day) {
    days.remove(day);
  }

  @override
  String toString() {
    String dayList = days.map((day) => '- ${day.title}').join('\n');
    return 'Schedule:\n$dayList';
  }
}
