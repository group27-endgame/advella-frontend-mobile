import 'package:advella/cards/product_card.dart';
import 'package:advella/models/product.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  List<OldProduct> products = [
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('House for sale', '60000 kr.', 'Lunderskov, 3030', 'assets/images/grass2.jpg'),
    OldProduct('Bicycle', '250 kr.', 'Horsens, 8700', 'assets/images/bike5.jpg'),
    OldProduct('IKEA closet', '1500 kr.', 'Copenhagen, 1500', 'assets/images/closet5.jpg'),
    OldProduct('Lian li pc', '10500 kr.', 'Kolding, 6800', 'assets/images/lian-li-pc.jpg'),
    OldProduct('Original Porsche Macan', '110000 kr.', 'Horsens, 8700', 'assets/images/porsche.jpg'),
    OldProduct('Rustic cabinet', '65 kr.', 'Vejen, 6600', 'assets/images/cabinet.jpg'),
    OldProduct('Nike Dunk Low Black/White', '1499 kr.', 'Horsens, 8700', 'assets/images/nike.jpg'),
    OldProduct('Study table with adjustable height', '600 kr.', 'Silkeborg, 9800', 'assets/images/table.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Text('Ya cheeky wanker'),
    );
  }
}
