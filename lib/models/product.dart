import 'package:advella/models/product_category.dart';
import 'package:advella/models/user_model.dart';

class Product
{
  final int productId;
  final String title;
  final String detail;
  final double moneyAmount;
  final String pickUpLocation;
  final int postedDateTime;
  final int deadline;
  final String productStatus;
  final int numberOfBids;
  final ProductCategory productCategory;
  final UserModel userPosted;
//final List<ProductImage> productImages;

  Product({
    required this.productId,
    required this.title,
    required this.detail,
    required this.moneyAmount,
    required this.pickUpLocation,
    required this.postedDateTime,
    required this.deadline,
    required this.productStatus,
    required this.numberOfBids,
    required this.productCategory,
    required this.userPosted,
    //required this.serviceImages
  });

  static Product fromJson(json) {
    return Product(
      productId: json['productId'],
      title: json['title'],
      detail: json['detail'],
      moneyAmount: json['moneyAmount'],
      pickUpLocation: json['pickUpLocation'],
      postedDateTime: json['postedDateTime'],
      deadline: json['deadline'],
      productStatus: json['productStatus'],
      numberOfBids: json['numberOfBids'],
      productCategory: ProductCategory.fromJson(json['productCategory']),
      userPosted: UserModel.fromJson(json['posted']),
      //serviceImages: json['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
    );
  }

  static Map<String, dynamic> toJson(Product product) {
    Map<String, dynamic> jsonMap = {
      "productId": product.productId,
      "title": product.title,
      "detail": product.detail,
      "moneyAmount": product.moneyAmount,
      "pickUpLocation": product.pickUpLocation,
      "postedDateTime": product.postedDateTime,
      "deadline": product.deadline,
      "productStatus": product.productStatus,
      "numberOfBids": product.numberOfBids,
      "productCategory": ProductCategory.toJson(product.productCategory),
      "posted": UserModel.toJson(product.userPosted)
    };

    return jsonMap;
  }
}


class OldProduct
{
  String title;
  String price;
  String location;
  String image;

  OldProduct(this.title, this.price, this.location, this.image);
}