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
}