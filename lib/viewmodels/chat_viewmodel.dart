import 'package:advella/models/ChatMessage.dart';
import 'package:advella/services/chat_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import '../models/user_model.dart';
import 'LoadingStatus.dart';

class ChatViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  ChatService chatService = new ChatService();
  UserModel? userModel;

  var chats = <ChatMessage>[];
  var chatsRecipient = <ChatMessage>[];
  var chatTexts = <String>[];
  List<types.TextMessage> messages = [];

  Future<void> getAllMessages(int senderId, int recipientId) async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.chatTexts.clear();
    this.messages.clear();

    this.chats = (await chatService.getAllMessages(senderId, recipientId))!;
    this.chatsRecipient = (await chatService.getAllMessages(recipientId, senderId))!;

    chats.addAll(chatsRecipient);
    chats.sort((a, b){
      return b.sentTime.compareTo(a.sentTime);
    });

    for(var c in this.chats)
      {
        types.TextMessage textMessage = types.TextMessage(
          author: types.User(
            id: c.chatMessageSender.userId.toString(),
          ),
          id: Uuid().v4(),
          text: c.chatContent,
          // repliedMessage: types.TextMessage(
          //     author: types.User(
          //       id: c.chatMessageSender.userId.toString(),
          //     ),
          //     id: Uuid().v1(),
          //     text: c.chatContent,
          // )
        );

        messages.add(textMessage);
      }

    //notifyListeners();

    if (this.chats.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }
}