import 'dart:convert';

import 'package:advella/models/product_category.dart';
import 'package:advella/models/service_category.dart';
import 'package:http/http.dart';

class CategoryService
{
  final String url = "https://api.advella.popal.dev/api";

  Future<List<ServiceCategory>?> getAllServiceCategories() async
  {
    try {
      var response = await get(Uri.parse("$url/service-categories/all"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        print('[SERVICE CATEGORIES]: ${responseDetails}');

        List<ServiceCategory> categories = List<ServiceCategory>.from(responseDetails.map((data) => ServiceCategory.fromJson(data)));

        return categories;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<ProductCategory>?> getAllProductCategories() async
  {
    try {
      var response = await get(Uri.parse("$url/product-categories/all"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        print('[PRODUCT CATEGORIES] ${responseDetails}');

        List<ProductCategory> categories = List<ProductCategory>.from(responseDetails.map((data) => ProductCategory.fromJson(data)));

        return categories;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }


}