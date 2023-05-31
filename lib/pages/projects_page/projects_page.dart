import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
import 'package:task_manager/pages/projects_page/local_widgets/create_project_widget.dart';
import 'package:task_manager/pages/projects_page/local_widgets/project_card.dart';
import 'package:task_manager/theme/custom_colors.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  void initState() {
    context.read<ProjectsBloc>().add(GetProjectsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Center(child: Text('Projects')),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width / 30,
        ),
        child: BlocBuilder<ProjectsBloc, ProjectsState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is LoadingFailed) {
              return const Center(child: Text('Something went wrong'));
            }
            if (state is LoadingSucceed) {
              return CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 2 / 2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < state.projects.length) {
                          return ProjectCard(project: state.projects[index]);
                        } else {
                          return const CreateProjectWidget();
                        }
                      },
                      childCount: state.projects.length + 1,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
