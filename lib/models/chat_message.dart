import 'package:advella/models/user_model.dart';

class ChatMessage {
  final int id;
  final String chatId;
  final String chatContent;
  final UserModel chatMessageSender;
  final UserModel chatMessageRecipient;
  final String chatStatus;
  final int sentTime;

  ChatMessage(
      {required this.id,
        required this.chatId,
        required this.chatContent,
        required this.chatMessageSender,
        required this.chatMessageRecipient,
        required this.chatStatus,
      required this.sentTime});

  static Map<String, dynamic> toJson(ChatMessage message) {
    Map<String, dynamic> jsonMap = {
      "id": message.id,
      "chatId": message.chatId,
      "chatContent": message.chatContent,
      "chatMessageSender": UserModel.toJson(message.chatMessageSender),
      "chatMessageRecipient": UserModel.toJson(message.chatMessageRecipient),
      "sentTime": message.sentTime
    };

    return jsonMap;
  }
}