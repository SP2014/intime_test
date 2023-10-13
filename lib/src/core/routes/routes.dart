import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intime_test/src/core/routes/routes_location.dart';
import 'package:intime_test/src/core/splash_screen.dart';
import 'package:intime_test/src/features/auth/auth.dart';
import 'package:intime_test/src/features/conversation/conversation.dart';

final navigationKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final routes = [
  GoRoute(
    path: RoutesLocation.auth,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
      path: RoutesLocation.conversation,
      parentNavigatorKey: navigationKey,
      builder: (context, state) => const ConversationScreen(),
      routes: [
        GoRoute(
          path: RoutesLocation.chat,
          builder: (context, state) {
            final pageModel = state.extra! as Map<String, dynamic>;
            return ChatScreen(
                name: pageModel['name']!,
                uid: pageModel['uid']!,
                profilePic: pageModel['profilePic']!);
          },
        ),
        GoRoute(
          path: RoutesLocation.profile,
          builder: (context, state) => const ProfilePreviewScreen(),
        ),
      ]),
  GoRoute(
    path: RoutesLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => const SplashScreen(),
  ),
];
