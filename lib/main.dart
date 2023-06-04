import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/page_controller/page_controller_bloc.dart';
import 'package:task_manager/bloc/project_details/project_details_bloc.dart';
import 'package:task_manager/bloc/projects/projects_bloc.dart';
import 'package:task_manager/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ProjectDetailsBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProjectsBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => PageControllerBloc(),
        )
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
