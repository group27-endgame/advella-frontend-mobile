import 'dart:convert';

import 'package:advella/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserLocalStorageService
{
  final _storage = new FlutterSecureStorage();

  Future<bool> isLoggedIn() async
  {
    return await _storage.read(key: "login_details") != null;
  }

  Future<UserModel> getUser() async
  {
    String? userData = await _storage.read(key: "login_details");

    return UserModel.fromJson(jsonDecode(userData!));
  }

  Future saveUser(UserModel user) async
  {
    await _storage.write(key: "login_details", value: jsonEncode(UserModel.toJson(user)));
  }

  Future removeUser() async
  {
    await _storage.delete(key: "login_details");
  }

  Future<UserModel?> getLoginDetails() async{
    //final prefs = await SharedPreferences.getInstance();
    //String? userData = prefs.getString("login_details");

    String? userData = await _storage.read(key: "login_details");

    print('[DATAAAAAAAAAAAA]: $userData');

    if(userData == null)
      return null;

    Map userJson = jsonDecode(userData);

    return UserModel(
        userId: userJson['userId'],
        userEmail: userJson['email'],
        userName: userJson['username'],
        description: userJson['description'],
        token: userJson['token']
    );
  }

  Future setLoginDetails(UserModel user) async
  {
    //final prefs = await SharedPreferences.getInstance();
    //prefs.setString("login_details", jsonEncode(user.toJson()));

    await _storage.write(key: "login_details", value: jsonEncode(UserModel.toJson(user)));
  }
}