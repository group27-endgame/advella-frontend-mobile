import 'dart:convert';
import 'dart:io';

import 'package:advella/models/product.dart';
import 'package:advella/models/product_category.dart';
import 'package:advella/models/product_image.dart';
import 'package:advella/models/user_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class ProductService
{
  final String url = "https://api.advella.popal.dev/api/products";

  Future<List<Product>?> getAllProducts() async
  {
    try {
      var response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        //print('[PRODUCTS]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Product> products = [];

        for (var p in responseDetails) {
          // print('ppppppppppppppppppppppppppppppppppppppppp');
          // print(p);

          if(p['posted'] is int)
          {

          }

          else {
            Product product = Product(
              productId: p['productId'],
              title: p['title'],
              detail: p['detail'],
              moneyAmount: p['moneyAmount'],
              pickUpLocation: p['pickUpLocation'],
              postedDateTime: p['postedDateTime'],
              deadline: p['deadline'],
              productStatus: p['productStatus'],
              numberOfBids: p['numberOfBids'],
              productCategory: ProductCategory.fromJson(p['productCategory']),
              userPosted: UserModel.fromJson(p['posted']),
              //serviceImages: s['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
            );

            //print(product.productId);

            if(p['productImages'].length > 0) product.productImage = ProductImage.fromJson(p['productImages'][0]);

            products.add(product);
          }
        }

        //print('product length');
        print(products.length);

        return products;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<Product>?> getLatestProducts() async
  {
    try {
      var response = await get(Uri.parse("$url/latest?amount=100"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        //print('[PRODUCTS]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Product> products = [];

        for (var p in responseDetails) {
          // print('ppppppppppppppppppppppppppppppppppppppppp');
          // print(p);

          if(p['posted'] is int)
          {

          }

          else {
            Product product = Product(
              productId: p['productId'],
              title: p['title'],
              detail: p['detail'],
              moneyAmount: p['moneyAmount'],
              pickUpLocation: p['pickUpLocation'],
              postedDateTime: p['postedDateTime'],
              deadline: p['deadline'],
              productStatus: p['productStatus'],
              numberOfBids: p['numberOfBids'],
              productCategory: ProductCategory.fromJson(p['productCategory']),
              userPosted: UserModel.fromJson(p['posted']),
              //serviceImages: s['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
            );

            //print(product.productId);

            if(p['productImages'].length > 0) product.productImage = ProductImage.fromJson(p['productImages'][0]);

            products.add(product);
          }
        }

        //print('product length');
        print(products.length);

        return products;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future postProduct(String? token, var product, File image) async
  {
    print('[FUCKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK] ${jsonEncode(product)}');
    var formData = dio.FormData.fromMap({
      'newProduct': await dio.MultipartFile.fromString(jsonEncode(product), contentType: MediaType.parse("application/json")),
      'image': await dio.MultipartFile.fromFile(image.path, filename: image.path.split("/").last)
    });

    var response = await dio.Dio().post('$url/new', data: formData, options: dio.Options(headers:{"Authorization": "Bearer $token", "Content-Type": "multipart/form-data"}));
    //print(response.statusCode);
    // try {
    //   await post(Uri.parse(url), headers: {
    //     "Authorization": "Bearer $token", "Content-Type": "application/json"
    //   }, body: product);//Product.toJson(product));
    // }
    // catch(e) {
    //   print(e.toString());
    // }
  }

  Future bidProduct(String? access_token, int productId, int moneyAmount) async
  {
    try {
      await post(Uri.parse(
          "https://api.advella.popal.dev/api/users/bid/product/$productId?amount=$moneyAmount"),
          headers: {
            "Authorization": "Bearer $access_token",
            "Content-Type": "application/json"
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Product>?> getProductsPostedByUser(int userId) async
  {
    try {
      var response = await get(Uri.parse("$url/user/$userId?amount=100"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        //print('[PRODUCTS]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Product> products = [];

        for (var p in responseDetails) {
          // print('ppppppppppppppppppppppppppppppppppppppppp');
          // print(p);

          if(p['posted'] is int)
          {

          }

          else {
            Product product = Product(
              productId: p['productId'],
              title: p['title'],
              detail: p['detail'],
              moneyAmount: p['moneyAmount'],
              pickUpLocation: p['pickUpLocation'],
              postedDateTime: p['postedDateTime'],
              deadline: p['deadline'],
              productStatus: p['productStatus'],
              numberOfBids: p['numberOfBids'],
              productCategory: ProductCategory.fromJson(p['productCategory']),
              userPosted: UserModel.fromJson(p['posted']),
              //serviceImages: s['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
            );

            //print(product.productId);

            if(p['productImages'].length > 0) product.productImage = ProductImage.fromJson(p['productImages'][0]);

            products.add(product);
          }
        }

        //print('product length');
        print(products.length);

        return products;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Map<String, Object>?> getHighestBidder(int productId) async {
    try {
      var response = await get(Uri.parse("$url/bidders/highest/$productId"));
      var responseDetails = jsonDecode(response.body);

      print("yyyyyyyyyyyyyyyyy ${responseDetails}");

      //UserModel userModel = new UserModel(userId: int.parse(response.body['userId']), userEmail: response.body['userEmail'], description: response.body['description']);

      int amount = 0;

      for(var r in responseDetails["bidProducts"])
      {
        if(r["id"]["product"] == productId)
        {
          amount = r["amount"];
        }
      }

      Map<String, Object> map = {
        "user": UserModel.fromJson(responseDetails),
        "amount": amount
      };

      return map;
      // return UserModel.fromJson(responseDetails);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<UserModel>?> getAllBiddersProduct(int productId) async
  {
    try {
      var response = await get(Uri.parse("$url/bidders/$productId"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        List<UserModel> users = [];

        for (var u in responseDetails) {
          UserModel user = UserModel(userId: u["userId"], userEmail: u["email"], userName: u["username"], description: u["description"]);

          users.add(user);

        }

        //print('service length');
        print(users.length);

        return users;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future closeProduct(int productId) async
  {
    try {
      await post(Uri.parse("$url/closed/$productId"));
    } catch (e) {
      print(e.toString());
    }
  }

  Future openProduct(int productId) async
  {
    try {
      await post(Uri.parse("$url/open/$productId"));
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteProduct(String? access_token, int productId) async
  {
    try {
      await delete(Uri.parse(
          "$url/$productId"),
          headers: {
            "Authorization": "Bearer $access_token",
            "Content-Type": "application/json"
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Product>?> getProductsByCategory(int categoryId) async
  {
    try {
      var response = await get(Uri.parse("$url/category/$categoryId"));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        //print('[PRODUCTS]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Product> products = [];

        for (var p in responseDetails) {
          // print('ppppppppppppppppppppppppppppppppppppppppp');
          // print(p);

          if(p['posted'] is int)
          {

          }

          else {
            Product product = Product(
              productId: p['productId'],
              title: p['title'],
              detail: p['detail'],
              moneyAmount: p['moneyAmount'],
              pickUpLocation: p['pickUpLocation'],
              postedDateTime: p['postedDateTime'],
              deadline: p['deadline'],
              productStatus: p['productStatus'],
              numberOfBids: p['numberOfBids'],
              productCategory: ProductCategory.fromJson(p['productCategory']),
              userPosted: UserModel.fromJson(p['posted']),
              //serviceImages: s['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
            );

            //print(product.productId);

            if(p['productImages'].length > 0) product.productImage = ProductImage.fromJson(p['productImages'][0]);

            products.add(product);
          }
        }

        //print('product length');
        print(products.length);

        return products;
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