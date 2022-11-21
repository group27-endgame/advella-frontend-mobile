import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:advella/services/product_service.dart';
import 'package:advella/services/service_service.dart';
import 'package:flutter/cupertino.dart';

import 'LoadingStatus.dart';

class ProductViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  ProductService productService = new ProductService();

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
}