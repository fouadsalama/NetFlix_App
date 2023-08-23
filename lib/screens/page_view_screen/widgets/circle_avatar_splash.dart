import 'package:flutter/material.dart';

class CircleAvatarSplash extends StatelessWidget {
  const CircleAvatarSplash({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26),
      child: Align(
        alignment: const Alignment(0, 0.9),
        child: Row(
          children: [
            buildCircle(index == 0 ? Colors.red : Colors.black),
            buildCircle(index == 1 ? Colors.red : Colors.black),
            buildCircle(index == 2 ? Colors.red : Colors.black),
          ],
        ),
      ),
    );
  }

  Container buildCircle(Color color) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: CircleAvatar(
        radius: 6,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 5,
          backgroundColor: color,
        ),
      ),
    );
  }
}
