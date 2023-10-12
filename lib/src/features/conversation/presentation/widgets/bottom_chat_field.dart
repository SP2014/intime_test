import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/features/auth/auth.dart';
import 'package:intime_test/src/features/conversation/domain/domain.dart';
import 'package:intime_test/src/utils/extensions.dart';

class BottomChatField extends HookConsumerWidget {
  const BottomChatField({super.key, required this.receiverId});
  final String receiverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController(text: '');
    final isShowSendButton = useState(false);
    final focusNode = useState(FocusNode());

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              focusNode: focusNode.value,
              controller: messageController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  isShowSendButton.value = true;
                } else {
                  isShowSendButton.value = false;
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConstants.colorBg18,
                hintText: 'Send message',
                focusColor: ColorConstants.colorBg,
                hintStyle:
                    const TextStyle(fontSize: 16, color: Color(0xFF707D8B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 14,
                ),
              ),
            ),
          ),
          24.vgap(),
          GestureDetector(
            onTap: isShowSendButton.value
                ? () async {
                    final currentUser =
                        await ref.read(authControllerProvider).getCurrentUser();
                    ref.read(chatRepositoryProvider).sendTextMessage(
                        text: messageController.text,
                        receiverId: receiverId,
                        senderUser: currentUser!);
                  }
                : null,
            child: Icon(Icons.send, size: 24, color: ColorConstants.colorBg),
          ),
        ],
      ),
    );
  }
}
