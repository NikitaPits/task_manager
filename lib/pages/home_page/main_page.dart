import 'package:flutter/material.dart';
import 'package:task_manager/UI/buttons/play_button.dart';
import 'package:task_manager/theme/custom_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Text('Main Page'),
                PlayButton(
                  onTap: () {},
                  size: 30,
                ),
              ],
            )),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Main page')),
        ],
      ),
    );
  }
}
