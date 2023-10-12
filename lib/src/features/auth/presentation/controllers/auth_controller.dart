import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intime_test/src/features/auth/data/data.dart';
import 'package:intime_test/src/features/auth/domain/domain.dart';
import 'package:intime_test/src/features/conversation/conversation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
AuthController authController(AuthControllerRef ref) =>
    AuthController(authRepository: ref.watch(authRepositoryProvider));

class AuthController {
  const AuthController({required this.authRepository});
  final AuthRepository authRepository;

  void authenticateUser(
      String email, String password, String name, BuildContext context) {
    authRepository
        .signInWithEmail(email, password, userName: name)
        .then(
          (_) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (c) => const ConversationScreen(),
            ),
          ),
        )
        .onError((error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
  }

  Future<UserModel?> getCurrentUser() async {
    return authRepository.getCurrentUser();
  }

  Stream<UserModel> getUserStream(String userId) {
    return authRepository.userData(userId);
  }

  Stream<User?> authStateChanges() {
    return authRepository.authStateChanges();
  }
}
