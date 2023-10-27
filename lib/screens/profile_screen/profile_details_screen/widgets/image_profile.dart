import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Image.asset(image),
      ),
    );
  }
}
