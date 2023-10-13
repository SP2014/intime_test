import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intime_test/src/core/routes/routes_location.dart';
import 'package:intime_test/src/features/conversation/conversation.dart';
import 'package:intime_test/src/utils/extensions.dart';

class RecentWidget extends StatelessWidget {
  const RecentWidget({super.key, required this.data});
  final ChatContact data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        4.hgap(),
        ConversationListTile(
          leading: UserProfileWidget(
            profileImage: data.profilePic,
            onClick: () {
              context.go('${RoutesLocation.conversation}/profile');
            },
          ),
          onClick: () {
            context.go('${RoutesLocation.conversation}/chat', extra: {
              'name': data.name,
              'uid': data.contactId,
              'profilePic': data.profilePic
            });
          },
          child: TileContent(
              title: data.name, subtitle: '1h ago, 2 unread message'),
        ),
        24.hgap(),
      ],
    );
  }
}
