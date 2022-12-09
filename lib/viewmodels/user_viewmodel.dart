import 'package:advella/services/contact_us_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';
import '../services/local_storage/localstorage_user_service.dart';
import 'LoadingStatus.dart';

class UserViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  UserModel? userModel;

  ContactUsService contactUsService = new ContactUsService();

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

  Future<void> postContactUs(String content) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    await contactUsService.postContactUs(userModel!.token, content);
  }
}