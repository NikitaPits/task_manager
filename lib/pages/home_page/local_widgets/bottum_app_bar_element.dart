import 'package:flutter/material.dart';

class BottomAppBarElement extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;
  const BottomAppBarElement({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(title),
          ],
        ),
      ),
    );
  }
}
