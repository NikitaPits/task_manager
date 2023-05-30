import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/page_controller/page_controller_bloc.dart';
import 'package:task_manager/data/models/page_model.dart';
import 'package:task_manager/data/models/widgets_models/bottom_app_bar_item_model.dart';
import 'package:task_manager/pages/home_page/local_widgets/bottum_app_bar_element.dart';
import 'package:task_manager/pages/home_page/main_page.dart';
import 'package:task_manager/pages/projects_page/projects_page.dart';
import 'package:task_manager/theme/custom_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<BottomAppBarModel> bottomAppBarParameters = [
    BottomAppBarModel(Icons.home, 'Main'),
    BottomAppBarModel(Icons.notes, 'Projects'),
    // BottomAppBarModel(Icons.calendar_month, 'Schedule')
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageControllerBloc, PageModel>(
      builder: (context, state) {
        return Scaffold(
            body: PageView(
              controller: state.controller,
              // physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                context.read<PageControllerBloc>().add(JumpToPageEvent(value));
              },
              children: const [
                MainPage(),
                ProjectsPage(),
                // SchedulePage(),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 100,
              child: BottomAppBar(
                color: CustomColors.appBarColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          bottomAppBarParameters.asMap().entries.map((entry) {
                        final index = entry.key;
                        final element = entry.value;
                        return BottomAppBarElement(
                          icon: element.icon,
                          title: element.label,
                          onTap: () {
                            context
                                .read<PageControllerBloc>()
                                .add(JumpToPageEvent(index));
                          },
                        );
                      }).toList()),
                ),
              ),
            ));
      },
    );
  }
}
