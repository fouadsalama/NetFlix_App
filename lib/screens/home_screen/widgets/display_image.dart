import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    super.key,
    required this.posterUrl,
  });

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              posterUrl,
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
