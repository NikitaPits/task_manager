import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/theme/custom_colors.dart';

class TaskButtonWidget extends StatefulWidget {
  final Task task;
  final void Function(Task) onComplete;
  const TaskButtonWidget(
      {super.key, required this.task, required this.onComplete});

  @override
  State<TaskButtonWidget> createState() => _TaskButtonWidgetState();
}

class _TaskButtonWidgetState extends State<TaskButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onComplete(widget.task);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.completeButton,
        foregroundColor: CustomColors.bottomAppBarColor,
      ),
      child: const Text(
        'Complete Task',
        style: TextStyle(color: CustomColors.completeButtonText),
      ),
    );
  }
}
