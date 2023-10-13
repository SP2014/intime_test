import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/features/conversation/data/data.dart';
import 'package:intime_test/src/features/conversation/domain/domain.dart';
import 'package:intl/intl.dart';

import 'my_message_card.dart';
import 'sender_message_card.dart';

class ChatList extends HookConsumerWidget {
  const ChatList({super.key, required this.receiverId});
  final String receiverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scController = useScrollController();
    return StreamBuilder<List<ChatMessage>>(
        stream: ref.read(chatRepositoryProvider).getChatStream(receiverId),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          SchedulerBinding.instance.addPostFrameCallback((_) {
            scController.jumpTo(scController.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: scController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];
              var timeSent = DateFormat.Hm().format(messageData.timeSent);
              if (messageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: messageData.text,
                  date: timeSent,
                  isSeen: messageData.isSeen,
                  username:
                      FirebaseAuth.instance.currentUser!.displayName ?? '',
                );
              }
              return SenderMessageCard(
                message: messageData.text,
                date: timeSent,
                username: messageData.senderId,
              );
            },
          );
        });
  }
}
