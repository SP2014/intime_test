import 'package:go_router/go_router.dart';
import 'package:intime_test/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_notifier.dart';
import 'routes.dart';
import 'routes_location.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter appRoute(AppRouteRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: navigationKey,
    initialLocation: RoutesLocation.splash,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    routes: routes,
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) return null;
      final isAuth = authState.valueOrNull != null;
      final isSplash = state.matchedLocation == RoutesLocation.splash;
      if (isSplash) {
        return isAuth ? RoutesLocation.conversation : RoutesLocation.auth;
      }
      final isLoggedIn = state.matchedLocation == RoutesLocation.auth;
      if (isLoggedIn) return isAuth ? RoutesLocation.conversation : null;
      return isAuth ? null : RoutesLocation.splash;
    },
  );
}
