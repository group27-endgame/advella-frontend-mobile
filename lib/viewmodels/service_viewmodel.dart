import 'package:advella/models/service.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:advella/services/service_service.dart';
import 'package:flutter/cupertino.dart';

import 'LoadingStatus.dart';

class ServiceViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  ServiceService service = new ServiceService();

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
}