import 'package:advella/models/ChatMessage.dart';
import 'package:advella/models/ChatRoom.dart';
import 'package:advella/services/chat_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import '../models/user_model.dart';
import '../services/local_storage/localstorage_user_service.dart';
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

  List<types.Message> allMessages = [];

  var chatRooms = <ChatRoom>[];

  final _storage = new UserLocalStorageService();

  Future<void> getAllMessages(int senderId, int recipientId) async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.chats = (await chatService.getAllMessages(senderId, recipientId))!;
    this.chatsRecipient = (await chatService.getAllMessages(recipientId, senderId))!;
    //
    // chats.addAll(chatsRecipient);
    // chats.sort((a, b){
    //   return b.sentTime.compareTo(a.sentTime);
    // });
    //
    // for(var c in this.chats)
    //   {
    //     types.TextMessage textMessage = types.TextMessage(
    //       author: types.User(
    //         id: c.chatMessageSender.userId.toString(),
    //       ),
    //       id: Uuid().v4(),
    //       text: c.chatContent,
    //       // repliedMessage: types.TextMessage(
    //       //     author: types.User(
    //       //       id: c.chatMessageSender.userId.toString(),
    //       //     ),
    //       //     id: Uuid().v1(),
    //       //     text: c.chatContent,
    //       // )
    //     );
    //
    //     messages.add(textMessage);
    //   }

    //allMessages.addAll(messages);

    notifyListeners();

    if (this.chats.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> getAllChatRooms() async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    this.chatRooms = (await chatService.getAllChatRooms(userModel!.userId))!;

    if (this.chatRooms.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }
}