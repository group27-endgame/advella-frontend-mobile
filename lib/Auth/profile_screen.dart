import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Text("Profile"),
          TextButton(onPressed: () async{
            await UserLocalStorageService().removeUser();
            Navigator.pop(context);
          }, child: Text("Logoug"))
        ],
      ),
    );
  }
}
