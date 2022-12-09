import 'dart:convert';

import 'package:advella/models/ChatMessage.dart';
import 'package:advella/models/user_model.dart';
import 'package:http/http.dart';

class ChatService
{
  final String url = "https://api.advella.popal.dev/api/messages";

  Future<List<ChatMessage>?> getAllMessages(int senderId, int recipientId) async
  {
    try {
      var response = await get(Uri.parse("$url/$senderId/$recipientId"));

      print('[CHATTTTT]: ${response.statusCode}');

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        print('[CHATTTTT]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<ChatMessage> messages = [];

        for (var s in responseDetails) {

            ChatMessage message = ChatMessage(
                id: s['id'],
                chatId: s['chatId'],
                chatContent: s['chatContent'],
                chatMessageSender: UserModel(
                  userId: s['chatMessageSender']['userId'],
                  userEmail: "",
                  userName: s['chatMessageSender']['username'],
                  description: "",
                ),
                chatMessageRecipient: UserModel(
                  userId: s['chatMessageRecipient']['userId'],
                  userEmail: "",
                  userName: s['chatMessageRecipient']['username'],
                  description: "",
            ),
                chatStatus: s['chatStatus'],
                sentTime: s['sentTime']
            );

            //print(service.serviceId);

            messages.add(message);
        }

        print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${messages.length}');

        return messages;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}