import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/core/core.dart';

class BottomChatField extends HookConsumerWidget {
  const BottomChatField({super.key, required this.receiverId});
  final String receiverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController(text: '');
    final isShowSendButton = useState(false);
    final focusNode = useState(FocusNode());

    return Row(
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
              hintStyle:
                  const TextStyle(fontSize: 16, color: Color(0xFF707D8B)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(110.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 2,
            right: 2,
          ),
          child: GestureDetector(
            onTap: isShowSendButton.value ? () {} : null,
            child: Icon(
              Icons.send,
              size: 24,
              color: isShowSendButton.value
                  ? ColorConstants.colorBg
                  : Colors.grey.shade100,
            ),
          ),
        ),
      ],
    );
  }
}
