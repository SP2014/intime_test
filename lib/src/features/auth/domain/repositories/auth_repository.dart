import 'package:firebase_auth/firebase_auth.dart';
import 'package:intime_test/src/features/auth/data/models/models.dart';

abstract class AuthRepository {
  Future<UserModel?> getCurrentUser();
  Future<void> signInWithEmail(String email, String password,
      {String? userName});
  Stream<UserModel> userData(String userId);
  Stream<User?> authStateChanges();
  Future<void> logout();
}
