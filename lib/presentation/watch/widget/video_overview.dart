import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({required this.overview, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          overview,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        )
      ],
    );
  }
}
