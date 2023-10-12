import 'package:flutter/material.dart';
import 'package:intime_test/src/core/core.dart';

class MessageBanner extends StatelessWidget {
  const MessageBanner(
      {super.key, required this.message, this.onDismiss, this.backgroundColor});
  final String message;
  final VoidCallback? onDismiss;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 4.0,
              top: 8.0,
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Color(0xFF0C1E3C),
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          TextButton(
              onPressed: onDismiss,
              child: Text(
                StringConstants.dismissButtonText,
                style: TextStyle(
                  color: ColorConstants.colorBg,
                  fontSize: 16,
                ),
              )),
        ],
      ),
    );
  }
}
