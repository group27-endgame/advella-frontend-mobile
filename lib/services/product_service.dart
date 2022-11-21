import 'dart:convert';

import 'package:advella/models/product.dart';
import 'package:advella/models/product_category.dart';
import 'package:advella/models/user_model.dart';
import 'package:http/http.dart';

class ProductService
{
  final String url = "https://api.advella.popal.dev/api/products";

  Future<List<Product>?> getAllProducts() async
  {
    try {
      var response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        print('[PRODUCTS]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Product> products = [];

        for (var p in responseDetails) {
          print('ppppppppppppppppppppppppppppppppppppppppp');
          print(p);

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

            products.add(product);
          }
        }

        print('product length');
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

  Future postProduct(String? token, Product product) async
  {
    try {
      await post(Uri.parse(url), headers: {
        "Authorization": "Bearer $token", "Content-Type": "application/json"
      }, body: Product.toJson(product));
    }
    catch(e) {
      print(e.toString());
    }
  }
}