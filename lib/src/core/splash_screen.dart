import 'package:flutter/material.dart';
import 'package:intime_test/src/utils/extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            24.hgap(),
            const Text(
              'InTime',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            16.hgap(),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
