import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_contact.g.dart';
part 'chat_contact.freezed.dart';

@freezed
class ChatContact with _$ChatContact {
  const ChatContact._();

  const factory ChatContact({
    required String name,
    required String profilePic,
    required String contactId,
    required DateTime timeSent,
    required String lastMessage,
  }) = _ChatContact;

  factory ChatContact.fromJson(Map<String, dynamic> json) =>
      _$ChatContactFromJson(json);
}
