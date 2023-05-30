import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final void Function() onTap;
  final double? size;
  const PlayButton({super.key, required this.onTap, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 25,
        height: size ?? 25,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
