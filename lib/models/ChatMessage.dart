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
}