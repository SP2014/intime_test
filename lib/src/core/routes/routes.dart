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
    path: RoutesLocation.chat,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final pageModel = state.pathParameters;
      return ChatScreen(
          name: pageModel['name']!,
          uid: pageModel['uid']!,
          profilePic: pageModel['profilePic']!);
    },
  ),
  GoRoute(
    path: RoutesLocation.conversation,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => const ConversationScreen(),
  ),
  GoRoute(
    path: RoutesLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => const SplashScreen(),
  ),
];
