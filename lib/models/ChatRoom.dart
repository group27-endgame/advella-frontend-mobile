import 'package:advella/models/user_model.dart';

class ChatRoom
{
  final int id;
  final String chatId;
  final UserModel chatSender;
  final UserModel chatRecipient;

  ChatRoom({required this.id, required this.chatId, required this.chatSender, required this.chatRecipient});
}