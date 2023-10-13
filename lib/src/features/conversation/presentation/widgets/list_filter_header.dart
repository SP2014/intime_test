import 'package:flutter/material.dart';

class ListFilterHeader extends StatelessWidget {
  const ListFilterHeader({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All patients',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: RichText(
            text: const TextSpan(
                text: 'Recent first',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: ' - '),
                  TextSpan(
                      text: 'tap to filter',
                      style: TextStyle(
                        color: Colors.blue,
                      ))
                ]),
          ),
        )
      ],
    );
  }
}
