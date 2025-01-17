import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime releaseDate;

  const VideoReleaseDate({required this.releaseDate, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
        ),
        Text(
          releaseDate.toString().split(' ')[0],
        )
      ],
    );
  }
}
