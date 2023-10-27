import 'package:flutter/material.dart';

class CustomProfileElements extends StatelessWidget {
  const CustomProfileElements({
    super.key,
    required this.image,
    required this.text,
    this.onPressed,
  });
  final String image;
  final String text;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  image,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
              const SizedBox(width: 37 - 26),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
