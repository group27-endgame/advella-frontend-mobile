import 'package:advella/screens/chat_screen.dart';
import 'package:advella/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../Auth/profile_screen.dart';

class ChatRoomsScreen extends StatefulWidget {
  const ChatRoomsScreen({Key? key}) : super(key: key);

  @override
  _ChatRoomsScreenState createState() => _ChatRoomsScreenState();
}

class _ChatRoomsScreenState extends State<ChatRoomsScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
        builder: (context, viewmodel, child) {
          return FutureBuilder(
            future: Future.wait([
              viewmodel.getAllChatRooms(),
            ]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (viewmodel.chatRooms == null) {
                return Container(
                  child: Center(
                    child: SpinKitCircle(
                      size: 100,
                      itemBuilder: (context, index) {
                        final colors = [Colors.blue, Colors.white];
                        final color = colors[index % colors.length];

                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        );
                      },
                    ),
                    //Text('No bookings exist'),
                  ),
                );
              }
              else
                {
                  return Scaffold(
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(top: 5, left: 0),
                                    child: Text(
                                      'Your Chats',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  new Spacer(),
                                  GestureDetector(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      width: 45,
                                      height: 45,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset('assets/images/profile_pic.png'),
                                      ),
                                    ),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: viewmodel.chatRooms.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                if(viewmodel.chatRooms.isEmpty) {
                                  return Container(
                                    child: Center(
                                      child: Text('No chat rooms exist'),
                                    ),
                                  );
                                }
                                else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${viewmodel.chatRooms[index].chatRecipient.userName}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${viewmodel.chatRooms[index].chatRecipient.userEmail}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              ],
                                            ),
                                            new Spacer(),
                                            ElevatedButton(
                                              onPressed: (){},
                                              child: Text(
                                                  'Chat'
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.pink),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            }
          );
        }
    );
  }

  }