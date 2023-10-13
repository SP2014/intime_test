import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/user_profile_widget.dart';
import 'package:intime_test/src/utils/extensions.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserProfileWidget(
            profileImage: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
            size: 132,
          ),
          16.vgap(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_photo(), _photo(), _photo()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _photo(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _photo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: 'https://i.pravatar.cc/150',
        width: 60,
        height: 60,
      ),
    );
  }
}
