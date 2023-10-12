import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intime_test/src/features/auth/data/models/user_model.dart';
import 'package:intime_test/src/features/auth/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.auth, required this.firestore});
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  @override
  Future<UserModel?> getCurrentUser() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromJson(userData.data()!);
    }
    return user;
  }

  @override
  Future<void> signInWithEmail(String email, String password,
      {String? userName}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      if (auth.currentUser != null) {
        var user = UserModel(
          name: userName ?? '',
          uid: auth.currentUser!.uid,
          profilePic: 'https://i.pravatar.cc/300',
          isOnline: true,
          phoneNumber: auth.currentUser!.phoneNumber ?? '',
        );
        await firestore
            .collection('users')
            .doc(auth.currentUser!.uid)
            .set(user.toJson());
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Stream<UserModel> userData(String userId) {
    return firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  @override
  Stream<User?> authStateChanges() async* {
    yield* auth.authStateChanges();
  }
}
