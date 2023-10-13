import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intime_test/src/features/auth/auth.dart';
import 'package:intime_test/src/features/conversation/data/data.dart';
import 'package:intime_test/src/features/conversation/domain/domain.dart';
import 'package:uuid/uuid.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl({required this.firestore, required this.auth});
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  @override
  Stream<List<ChatContact>> getChatContacts() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatContact> contacts = [];
      for (var document in event.docs) {
        var chatContact = ChatContact.fromJson(document.data());
        var userData = await firestore
            .collection('users')
            .doc(chatContact.contactId)
            .get();
        var user = UserModel.fromJson(userData.data()!);

        contacts.add(
          ChatContact(
            name: user.name,
            profilePic: user.profilePic,
            contactId: chatContact.contactId,
            timeSent: chatContact.timeSent,
            lastMessage: chatContact.lastMessage,
          ),
        );
      }
      return contacts;
    });
  }

  @override
  Stream<List<ChatMessage>> getChatStream(String receiverUserId) {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(receiverUserId)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<ChatMessage> messages = [];
      for (var document in event.docs) {
        messages.add(ChatMessage.fromJson(document.data()));
      }
      return messages;
    });
  }

  @override
  Future<void> saveContacts(UserModel user) {
    // TODO: implement saveContacts
    throw UnimplementedError();
  }

  @override
  Future<void> sendTextMessage(
      {required String text,
      required String receiverId,
      required UserModel senderUser}) async {
    try {
      var timeSent = DateTime.now();
      UserModel? recieverUserData;
      var userDataMap =
          await firestore.collection('users').doc(receiverId).get();
      recieverUserData = UserModel.fromJson(userDataMap.data()!);

      var recieverChatContact = ChatContact(
        name: senderUser.name,
        profilePic: senderUser.profilePic,
        contactId: senderUser.uid,
        timeSent: timeSent,
        lastMessage: text,
      );
      await firestore
          .collection('users')
          .doc(receiverId)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .set(
            recieverChatContact.toJson(),
          );
      // users -> current user id  => chats -> reciever user id -> set data
      var senderChatContact = ChatContact(
        name: recieverUserData.name,
        profilePic: recieverUserData.profilePic,
        contactId: recieverUserData.uid,
        timeSent: timeSent,
        lastMessage: text,
      );
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(receiverId)
          .set(
            senderChatContact.toJson(),
          );

      var messageId = const Uuid().v1();

      final message = ChatMessage(
        senderId: auth.currentUser!.uid,
        recieverid: receiverId,
        text: text,
        timeSent: timeSent,
        messageId: messageId,
        isSeen: false,
      );
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(receiverId)
          .collection('messages')
          .doc(messageId)
          .set(
            message.toJson(),
          );
      await firestore
          .collection('users')
          .doc(receiverId)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .doc(messageId)
          .set(
            message.toJson(),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
