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
  var servicesPostedByUser = <Service>[];

  var bidders = <UserModel>[];

  UserModel? highestBidder;
  int? amount;

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

  Future<void> getLatestServices() async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.services = (await service.getLatestServices())!;

    if (this.services.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> getServicesPostedByUser() async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;



    this.servicesPostedByUser = (await service.getServicesPostedByUser(userModel!.userId))!;

    print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqq: ${this.servicesPostedByUser[0].title}");

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

  Future<void> getHighestBidder(int serviceId) async
  {
    print("222222222222222222222222");
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    // this.highestBidder = await service.getHighestBidder(serviceId);

    this.highestBidder = (await service.getHighestBidder(serviceId))!["user"] as UserModel?;
    this.amount = (await service.getHighestBidder(serviceId))!["amount"] as int?;


    if (this.highestBidder == null) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> getAllBiddersService(int serviceId) async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.bidders = (await service.getAllBiddersService(serviceId))!;

    if (this.bidders.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> closeService(int serviceId) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    await service.closeService(serviceId);
  }

  Future<void> openService(int serviceId) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    await service.openService(serviceId);
  }

  Future<void> deleteService(int serviceId) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    var user = await _storage.getUser();

    await service.deleteService(userModel!.token, serviceId);
  }
}