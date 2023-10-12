import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intime_test/src/features/auth/data/data.dart';
import 'package:intime_test/src/features/auth/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepositoryImpl(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final repo = ref.watch(authRepositoryProvider);
  return repo.authStateChanges();
}
