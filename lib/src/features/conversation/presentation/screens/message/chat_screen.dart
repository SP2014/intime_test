import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/widgets.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({
    super.key,
    required this.name,
    required this.uid,
    required this.profilePic,
  });
  final String name;
  final String uid;

  final String profilePic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          ChatProfileHeader(name: name, profilePic: profilePic),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ChatList(receiverId: uid),
          ),
          BottomChatField(receiverId: uid),
        ],
      ),
    );
  }
}
