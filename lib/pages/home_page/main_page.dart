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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_main.png'),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Welcome to your personal Task Manager!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
