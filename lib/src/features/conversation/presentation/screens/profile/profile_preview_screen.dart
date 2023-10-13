import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intime_test/src/core/constants/app_constants.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/photo_widget.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/widgets.dart';
import 'package:intime_test/src/utils/extensions.dart';

class ProfilePreviewScreen extends HookWidget {
  const ProfilePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Patient Details'),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectionList(
                    options: filters
                        .map((Map<String, dynamic> e) => OptionsModel(
                              leading: SvgPicture.asset(
                                e['prefixIcon'],
                                color: e['isActive'] ? Colors.white : null,
                              ),
                              title: e['name'],
                              isActive: e['isActive'],
                              data: e,
                            ))
                        .toList(),
                    onOptionClicked: (op) {}),
                24.hgap(),
                // Profile Header
                const PhotoWidget(),
                24.hgap(),
                // Title Widget
                const TitleWidget(
                    email: 'jane.cooper@longevityintime.org',
                    name: 'Jane Cooper'),
                24.hgap(),
                // Info Widget
              ],
            ),
          ),
        ),
      ),
    );
  }
}
