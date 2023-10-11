import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intime_test/src/features/conversation/data/data.dart';
import 'package:intime_test/src/features/conversation/domain/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) => ChatRepositoryImpl(
    firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance);
