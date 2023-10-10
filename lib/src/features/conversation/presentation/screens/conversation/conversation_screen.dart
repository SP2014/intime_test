import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/custom_search_bar.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/message_banner.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
