import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/theme/custom_colors.dart';

class TaskCard extends StatelessWidget {
  final void Function(Task) onComplete;
  final Task task;

  const TaskCard({Key? key, required this.task, required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: CustomColors.widgetsBgColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1.0,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: task.isCompleted
                        ? CustomColors.indicatorComplete
                        : CustomColors.red,
                  ),
                )
              ],
            ),
            const SizedBox(height: 6.0),
            const SizedBox(height: 6.0),
            ElevatedButton(
              onPressed: () {
                onComplete(task);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.completeButton,
                foregroundColor: CustomColors.bottomAppBarColor,
              ),
              child: const Text(
                'Complete Task',
                style: TextStyle(color: CustomColors.completeButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
