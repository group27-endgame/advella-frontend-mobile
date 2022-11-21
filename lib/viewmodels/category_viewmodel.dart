import 'package:advella/models/product_category.dart';
import 'package:advella/models/service.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/services/category_service.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:advella/services/service_service.dart';
import 'package:flutter/cupertino.dart';

import 'LoadingStatus.dart';

class CategoryViewModel with ChangeNotifier
{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  CategoryService categoryService = new CategoryService();

  var serviceCategories = <ServiceCategory>[];
  var productCategories = <ProductCategory>[];

  var categoryTitles = <String>[];

  final _storage = new UserLocalStorageService();

  Future<void> getAllServiceCategories() async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.serviceCategories = (await categoryService.getAllServiceCategories())!;

    // this.categoryTitles.clear();
    // for(var c in this.categories)
    // {
    //   this.categoryTitles.add(c.title);
    // }

    if (this.serviceCategories.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

  Future<void> getAllProductCategories() async
  {
    loadingStatus = LoadingStatus.Searching;

    // Refreshing token
    // String token = await AuthService().refreshToken(userModel!.access_token, userModel!.refresh_token);
    // userModel!.access_token = token;

    this.productCategories = (await categoryService.getAllProductCategories())!;
    print(productCategories[0].title);

    // this.categoryTitles.clear();
    // for(var c in this.categories)
    // {
    //   this.categoryTitles.add(c.title);
    // }

    if (this.productCategories.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    }

    else {
      loadingStatus = LoadingStatus.Completed;
    }
  }

}