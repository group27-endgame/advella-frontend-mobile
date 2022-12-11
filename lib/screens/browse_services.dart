import 'package:advella/listviews/products_trending.dart';
import 'package:advella/listviews/services_categories.dart';
import 'package:advella/listviews/services_trending.dart';
import 'package:advella/models/category.dart';
import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:flutter/material.dart';

class BrowseServices extends StatefulWidget {

  var trendingServices = <Service>[];
  var trendingProducts = <Product>[];
  //var trendingProducts = <OldProduct>[];
  var categories = <Category>[];

  BrowseServices(this.trendingServices, this.trendingProducts, this.categories);

  @override
  _BrowseServicesState createState() => _BrowseServicesState();
}

class _BrowseServicesState extends State<BrowseServices> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              'Trending Services',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 300, child: ServicesTrending(widget.trendingServices)),

          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Trending Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 300, child: ProductsTrending(widget.trendingProducts)),
        ],
      ),
    );
  }
}
