import 'package:flutter/material.dart';
import 'package:task_manager/theme/custom_colors.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Center(child: Text('Schedule')),
      ),
      body: const Center(child: Text('Schedule')),
    );
  }
}
