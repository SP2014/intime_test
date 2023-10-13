import 'package:flutter/material.dart';

class TileContent extends StatelessWidget {
  const TileContent({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(subtitle,
            style: const TextStyle(
              fontSize: 14,
            )),
      ],
    );
  }
}
