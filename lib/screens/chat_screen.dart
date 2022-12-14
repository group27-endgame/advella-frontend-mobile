import 'package:advella/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {

  int recipientId;
  String recipientUserName;

  ChatScreen(this.recipientId, this.recipientUserName);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<types.Message> _messages = [];
  bool isLoading = true;
  final _user = const types.User(
    id: '102',
  );

  ChatViewModel chatViewModel = ChatViewModel();

  // @override
  // void initState() {
  //   super.initState();
  //   // _loadMessages();
  //   //WidgetsBinding.instance.addPostFrameCallback((_) => _loadMessages());
  // }

  // @override
  // void didUpdateWidget(covariant ChatScreen oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   _loadMessages();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body:  Chat(
  //       messages: _messages,
  //       onAttachmentPressed: _handleAttachmentPressed,
  //       onMessageTap: _handleMessageTap,
  //       onPreviewDataFetched: _handlePreviewDataFetched,
  //       onSendPressed: _handleSendPressed,
  //       showUserAvatars: true,
  //       showUserNames: true,
  //       user: _user,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
        builder: (context, viewmodel, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '${widget.recipientUserName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Do not send any sensitive personal information as this communication line is not secure',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: Future.wait([
                          viewmodel.getAllMessages(widget.recipientId),
                        ]).then((value) {
                          var chats = viewmodel.chats;
                          chats.addAll(viewmodel.chatsRecipient);
                          chats.sort((a, b){
                            return b.sentTime.compareTo(a.sentTime);
                          });

                          List<types.TextMessage> messages = [];
                          for(var c in chats)
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

                          if(_messages.length != messages.length){

                            setState(() {
                              _messages = messages;
                            });
                          }
                        }),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Chat(
                            messages: _messages,//viewmodel.chatTexts.map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList(),
                            onAttachmentPressed: _handleAttachmentPressed,
                            onMessageTap: _handleMessageTap,
                            onPreviewDataFetched: _handlePreviewDataFetched,
                            onSendPressed: _handleSendPressed,
                            showUserAvatars: true,
                            showUserNames: true,
                            user: _user,
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  void _addMessage(types.TextMessage message) async {
    await chatViewModel.postMessage(message, widget.recipientId);
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      //_addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      //_addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
  //
  // void _loadMessages() async
  // {
  //   await chatViewModel.getAllMessages(102, 122);
  //   setState(() {
  //     _messages = chatViewModel.messages;
  //   });
  // }

// void _loadMessages() async {
//   final response = await rootBundle.loadString('assets/messages.json');
//   final messages = (jsonDecode(response) as List)
//       .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
//       .toList();
//
//   setState(() {
//     _messages = messages;
//   });
// }
}
