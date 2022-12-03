import 'dart:io';

import 'package:advella/models/product.dart';
import 'package:advella/models/product_category.dart';
import 'package:advella/models/service.dart';
import 'package:advella/models/user_model.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:advella/services/product_service.dart';
import 'package:advella/services/service_service.dart';
import 'package:flutter/cupertino.dart';

import 'LoadingStatus.dart';

class ProductViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  ProductService productService = new ProductService();
  UserModel? userModel;

  var products = <Product>[];

  final _storage = new UserLocalStorageService();

  Future<void> getAllProducts() async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.products = (await productService.getAllProducts())!;

    if (this.products.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> postProduct(String title, String description, int moneyAmount, String location, DateTime date, ProductCategory productCategory, File image) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    var user = await _storage.getUser();

    print('[USERRRRRRRRRRRRRRRRRRRRR0]: ${UserModel.toJson(user)}');

    Map<String, dynamic> json = {
      'title': title,
      'detail': description,
      'moneyAmount': moneyAmount,
      'pickUpLocation': location,
      'postedDateTime': DateTime
          .now()
          .millisecondsSinceEpoch,
      'deadline': date.millisecondsSinceEpoch,
      'productStatus': 'Open',
      'numberOfBids': 0,
      'productCategory': ProductCategory.toJson(
          productCategory!),
      'posted': {
        'userId': user.userId
      },
      //'image': image
    };

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;



    await productService.postProduct(userModel!.token, json, image);
  }

  Future<void> bidProduct(int productId, int moneyAmount) async
  {
    loadingStatus = LoadingStatus.Searching;
    userModel = await _storage.getLoginDetails();

    var user = await _storage.getUser();

    await productService.bidProduct(userModel!.token, productId, moneyAmount);
  }
}