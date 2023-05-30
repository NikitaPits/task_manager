import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/helpers/save_project.dart';
import 'package:task_manager/theme/custom_colors.dart';
import 'package:uuid/uuid.dart';

class CreateProjectWidget extends StatefulWidget {
  const CreateProjectWidget({Key? key}) : super(key: key);

  @override
  State<CreateProjectWidget> createState() => _CreateProjectWidgetState();
}

class _CreateProjectWidgetState extends State<CreateProjectWidget> {
  final TextEditingController _nameController = TextEditingController();
  final Uuid _uuid = const Uuid();
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: _isFlipped ? _buildBackCard() : _buildFrontCard(),
    );
  }

  Widget _buildFrontCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFlipped = true;
        });
      },
      child: const Card(
        color: CustomColors.createWidgetBgColor,
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 48.0),
              SizedBox(height: 8.0),
              Text('Create Project'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Project Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      CustomColors.createWidgetBgColor)),
              onPressed: () {
                String projectName = _nameController.text.trim();
                if (projectName.isNotEmpty) {
                  Project newProject = Project(
                    id: _uuid.v4(),
                    name: projectName,
                  );
                  saveProjectsToLocalStorage(newProject);
                  setState(() {
                    _isFlipped = false;
                  });
                  context.read<ProjectsBloc>().add(GetProjectsEvent());
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please enter a project name.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Create Project'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
