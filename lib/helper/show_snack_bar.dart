import 'package:flutter/material.dart';

void showSnackBar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 10, color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    backgroundColor: Colors.transparent,
  ));
}
