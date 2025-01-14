import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String title;
  const CategoryText({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
