import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
    this.profileImage,
    this.onClick,
    this.size = 48,
  });
  final String? profileImage;
  final VoidCallback? onClick;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        width: size ?? 48,
        height: size ?? 48,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: profileImage ?? 'https://i.pravatar.cc/100',
          ),
        ),
      ),
    );
  }
}
