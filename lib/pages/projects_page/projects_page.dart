import 'package:flutter/material.dart';
import 'package:task_manager/pages/projects_page/local_widgets/create_project_widget.dart';
import 'package:task_manager/theme/custom_colors.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Center(child: Text('Projects')),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
        child: const Column(children: [CreateProjectWidget()]),
      ),
    );
  }
}
