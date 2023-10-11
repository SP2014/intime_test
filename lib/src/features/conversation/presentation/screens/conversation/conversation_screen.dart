import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/widgets.dart';

class ConversationScreen extends HookConsumerWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConstants.colorBlack,
      appBar: AppBar(
        title: const Text('Patients'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 16,
                ),
                MessageBanner(
                  backgroundColor: ColorConstants.colorBg10,
                  message: StringConstants.messageText,
                  onDismiss: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomSearchBar(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  StringConstants.infoText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF20335B),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SelectionList(
                  options: const [
                    OptionsModel(title: 'Chats'),
                    OptionsModel(title: 'New Patient'),
                    OptionsModel(title: 'Quick Reply'),
                    OptionsModel(title: 'Chats'),
                    OptionsModel(title: 'New Patient'),
                    OptionsModel(title: 'Quick Reply'),
                    OptionsModel(title: 'Chats'),
                    OptionsModel(title: 'New Patient'),
                    OptionsModel(title: 'Quick Reply'),
                  ],
                  onOptionClicked: (m) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
