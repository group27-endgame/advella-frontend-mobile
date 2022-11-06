import 'package:findhelpie_flutter_app/cards/product_card.dart';
import 'package:findhelpie_flutter_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  List<Product> products = [
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('House for sale', '60000 kr.', 'Lunderskov, 3030', 'assets/images/grass2.jpg'),
    Product('Bicycle', '250 kr.', 'Horsens, 8700', 'assets/images/bike5.jpg'),
    Product('IKEA closet', '1500 kr.', 'Copenhagen, 1500', 'assets/images/closet5.jpg'),
    Product('Lian li pc', '10500 kr.', 'Kolding, 6800', 'assets/images/lian-li-pc.jpg'),
    Product('Original Porsche Macan', '110000 kr.', 'Horsens, 8700', 'assets/images/porsche.jpg'),
    Product('Rustic cabinet', '65 kr.', 'Vejen, 6600', 'assets/images/cabinet.jpg'),
    Product('Nike Dunk Low Black/White', '1499 kr.', 'Horsens, 8700', 'assets/images/nike.jpg'),
    Product('Study table with adjustable height', '600 kr.', 'Silkeborg, 9800', 'assets/images/table.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductCard(products),
    );
  }
}
