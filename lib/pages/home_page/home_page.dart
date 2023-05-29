import 'package:flutter/material.dart';
import 'package:task_manager/pages/home_page/local_widgets/bottum_app_bar_element.dart';
import 'package:task_manager/theme/custom_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: const Text('Hello'),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomAppBarElement(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {},
                ),
                BottomAppBarElement(
                  icon: Icons.notes,
                  title: 'Tasks',
                  onTap: () {},
                ),
                BottomAppBarElement(
                  icon: Icons.calendar_month,
                  title: 'Schedule',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
