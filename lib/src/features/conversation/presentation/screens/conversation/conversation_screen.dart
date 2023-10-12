import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/features/conversation/presentation/providers/providers.dart';
import 'package:intime_test/src/features/conversation/presentation/screens/message/chat_screen.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/widgets.dart';
import 'package:intime_test/src/utils/extensions.dart';

class ConversationScreen extends HookConsumerWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageVisibility = useState(true);
    final conversationController = ref.watch(conversationNotifierProvider);

    return Scaffold(
      backgroundColor: ColorConstants.colorWhite,
      appBar: AppBar(
        title: const Text(
          'Patients',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: conversationController.when(
              data: (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      16.hgap(),
                      messageVisibility.value
                          ? MessageBanner(
                              backgroundColor: ColorConstants.colorBg10,
                              message: StringConstants.messageText,
                              onDismiss: () {
                                messageVisibility.value = false;
                              },
                            )
                          : const SizedBox.shrink(),
                      16.hgap(),
                      const CustomSearchBar(),
                      4.hgap(),
                      Text(
                        StringConstants.infoText,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF20335B),
                        ),
                      ),
                      24.hgap(),
                      SelectionList(
                        options: data.filters!
                            .map((e) => OptionsModel(
                                  leading: SvgPicture.asset(e['prefixIcon']),
                                  title: e['name'],
                                ))
                            .toList(),
                        onOptionClicked: (m) {},
                      ),
                      24.hgap(),
                      Flexible(
                        child: ListView.builder(
                          itemCount: 12,
                          shrinkWrap: true,
                          itemBuilder: (c, i) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: ConversationListTile(
                              leading: UserProfileWidget(
                                onClick: () {
                                  debugPrint('I got clicked');
                                },
                              ),
                              onClick: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const ChatScreen(
                                        name: 'Ashish',
                                        uid: 'user1',
                                        profilePic:
                                            'https://i.pravatar.cc/100')));
                              },
                              trailing: SizedBox(
                                width: 24,
                                height: 24,
                                child: Center(
                                    child: SvgPicture.asset(
                                  i % 2 == 0
                                      ? CustomIcons.normalChatIcon
                                      : CustomIcons.activeChatIcon,
                                )),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jason LeBron',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text('Confirmed!',
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              error: (_, __) => const Center(
                    child: Text('Got some error while fetching data..'),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ),
      ),
    );
  }
}
