import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
import 'package:task_manager/data/models/project_model.dart';
import 'package:task_manager/helpers/manage_projects.dart';
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
      width: 250,
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
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Padding(
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _isFlipped = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.widgetsBgColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.createWidgetBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
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
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
