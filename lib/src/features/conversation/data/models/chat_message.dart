import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.g.dart';
part 'chat_message.freezed.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();
  const factory ChatMessage({
    required String senderId,
    required String recieverid,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required bool isSeen,
    String? repliedMessage,
    String? repliedTo,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
