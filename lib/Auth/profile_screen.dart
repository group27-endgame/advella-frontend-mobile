import 'package:advella/models/user_model.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String? _content = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, viewmodel, child) {
        return FutureBuilder(
            future: Future.wait([
             viewmodel.getUserDetails(),
            ]),
            builder:
                (BuildContext context, AsyncSnapshot snapshot) {
                  if (viewmodel.userModel == null) {
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
                        body: SingleChildScrollView(
                          child: SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 15, left: 20),
                                  child: Text(
                                    'Your Profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 55),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/profile_pic.png'),
                                        radius: 100,
                                      ),
                                    ),
                                    Text(
                                      '${viewmodel.userName}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      '${viewmodel.userEmail}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      child: Text(
                                        '${viewmodel.userDescription}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(

                                        ),
                                      ),
                                    ),
                                    TextButton(onPressed: () async{
                                      await UserLocalStorageService().removeUser();
                                      Navigator.pushReplacementNamed(context, "/login");
                                    }, child: Text("Log out")),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Text(
                                    'Contact us',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: SizedBox(
                                    height: 100,
                                    child: TextField(
                                      expands: true,
                                      maxLines: null,
                                      obscureText: false,
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Input any problems/comments",
                                        alignLabelWithHint: true,
                                      ),
                                      onChanged: (content) {
                                        setState(() {
                                          _content = content;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          await viewmodel.postContactUs(_content!);

                                          await Flushbar(
                                            flushbarPosition: FlushbarPosition.TOP,
                                            title: 'Thank you!',
                                            message: 'Your problem/comment has been sent',
                                            duration: Duration(seconds: 2),
                                          ).show(context);
                                        },
                                        child: Text(
                                          'Send',
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          shape:
                                          MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
