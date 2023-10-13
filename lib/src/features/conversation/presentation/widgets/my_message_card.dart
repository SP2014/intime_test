import 'package:flutter/material.dart';
import 'package:intime_test/src/core/core.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;

  final String username;

  final bool isSeen;

  const MyMessageCard({
    Key? key,
    required this.message,
    required this.date,
    required this.username,
    required this.isSeen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          color: ColorConstants.msgSenderColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 4,
              //   right: 10,
              //   child: Row(
              //     children: [
              //       Text(
              //         date,
              //         style: const TextStyle(
              //           fontSize: 13,
              //           color: Colors.white60,
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 5,
              //       ),
              //       Icon(
              //         isSeen ? Icons.done_all : Icons.done,
              //         size: 20,
              //         color: isSeen ? Colors.blue : Colors.white60,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
