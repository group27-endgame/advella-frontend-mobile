import 'dart:convert';

import 'package:advella/models/ChatMessage.dart';
import 'package:advella/models/ChatRoom.dart';
import 'package:advella/models/user_model.dart';
import 'package:http/http.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatService
{
  final String url = "https://api.advella.popal.dev/api/messages";

  Future<List<ChatMessage>?> getAllMessages(int senderId, int recipientId) async
  {
    try {
      var response = await get(Uri.parse("$url/$senderId/$recipientId"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

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

            messages.add(message);
        }
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

  Future postMessage(ChatMessage message, String? access_token) async
  {
    try {

      print("ZZZZZZZZZZZZZZZZZ ${jsonEncode(ChatMessage.toJson(message))}");

      var response = await post(Uri.parse(
          "$url/"),
          headers: {
            "Authorization": "Bearer $access_token",
            "Content-Type": "application/json"
          }, body: jsonEncode(ChatMessage.toJson(message)));

      print("ZZZZZZZZZZZZZZZZZ ${response.statusCode}");
      print("888888888888888888888888 ${response.body}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ChatRoom>?> getAllChatRooms(int userId) async
  {
    try {
      var response = await get(Uri.parse("https://api.advella.popal.dev/api/chatrooms/$userId"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        print('[ROOOOOMMS]: $responseDetails');

        List<ChatRoom> rooms = [];

        for (var s in responseDetails) {

          ChatRoom room = ChatRoom(
              id: s['id'],
              chatId: s['chatId'],
              chatSender: UserModel(
                userId: s['chatSender']['userId'],
                userEmail: s['chatSender']['email'],
                userName: s['chatSender']['username'],
                description: "",
              ),
              chatRecipient: UserModel(
                userId: s['chatRecipient']['userId'],
                userEmail: s['chatRecipient']['email'],
                userName: s['chatRecipient']['username'],
                description: "",
              ),
          );

          //print(service.serviceId);

          rooms.add(room);
        }

        return rooms;
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