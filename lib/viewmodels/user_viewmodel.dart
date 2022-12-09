import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';
import '../services/local_storage/localstorage_user_service.dart';
import 'LoadingStatus.dart';

class UserViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  UserModel? userModel;

  String? userName = "";
  String? userEmail = "";
  String? userDescription = "";

  final _storage = new UserLocalStorageService();

  Future<void> getUserDetails() async
  {
    userModel = await _storage.getLoginDetails();
    userName = userModel?.userName;
    userEmail = userModel?.userEmail;
    userDescription = userModel?.description;
  }
}