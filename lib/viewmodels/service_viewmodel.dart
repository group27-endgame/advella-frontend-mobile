import 'dart:io';

import 'package:advella/models/service.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:advella/services/service_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';
import 'LoadingStatus.dart';

class ServiceViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  ServiceService service = new ServiceService();
  UserModel? userModel;

  var services = <Service>[];

  final _storage = new UserLocalStorageService();

  Future<void> getAllServices() async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.services = (await service.getAllServices())!;

    if (this.services.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> postService(String title, String description, int moneyAmount, int duration, String location, DateTime date, ServiceCategory serviceCategory, File image) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    var user = await _storage.getUser();

    print('ttttttttttttttttttttttttttttttttttttttttttttt: ${moneyAmount}');

    Map<String, dynamic> json = {
      'title': title,
      'detail': description,
      'moneyAmount': moneyAmount,
      'duration': duration,
      'postedDateTime': DateTime
          .now()
          .millisecondsSinceEpoch,
      'deadline': date.millisecondsSinceEpoch,
      'location': location,
      'numberOfBids': 0,
      'serviceStatus': 'Open',
      'serviceCategory': ServiceCategory.toJson(
          serviceCategory!),
      'posted': {
        'userId': user.userId
      },
      //'image': image
    };

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;



    await service.postService(userModel!.token, json, image);
  }

  Future<void> bidService(int serviceId, int moneyAmount) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    var user = await _storage.getUser();

    await service.bidService(userModel!.token, serviceId, moneyAmount);
  }
}