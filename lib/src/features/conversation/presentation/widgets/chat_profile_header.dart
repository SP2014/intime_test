import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intime_test/src/core/core.dart';

class ChatProfileHeader extends StatelessWidget {
  const ChatProfileHeader({
    super.key,
    required this.name,
    required this.profilePic,
  });
  final String name;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 54),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: profilePic,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 54,
                height: 54,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
              child: Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(
              width: 34,
              height: 34,
              child: Center(
                  child: SvgPicture.asset(
                CustomIcons.callIcon,
              ))),
        ],
      ),
    );
  }
}
