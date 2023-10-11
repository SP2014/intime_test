import 'package:intime_test/src/features/conversation/data/data.dart';

abstract class ChatRepository {
  Stream<List<ChatContact>> getChatContacts();
  Stream<List<ChatMessage>> getChatStream(String receiverUserId);
  Future<void> saveContacts(UserModel user);
  Future<void> sendTextMessage(
      {required String text,
      required String receiverId,
      required UserModel senderUser});
}
