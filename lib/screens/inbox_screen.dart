import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Badge(
                  badgeContent: Text("3", style: TextStyle(color: Colors.white),),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                                      radius: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Need to fix my bike"),
                                        Text("Nitin Arora", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("2 min ago"),
                              ],
                            ),
                            Text("Hello, where can I come? My phone number ...", style: TextStyle(color: Colors.grey, fontSize: 12),),
                            SizedBox(height: 1,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}