import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/core/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(appRouteProvider);
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'InTime',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.colorBg),
          useMaterial3: true,
        ).copyWith(
            textTheme: GoogleFonts.dmSansTextTheme(),
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            )),
        routerConfig: route,
        restorationScopeId: 'InTime');
  }
}
