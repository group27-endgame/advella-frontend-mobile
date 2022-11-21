import 'package:advella/listviews/products_trending.dart';
import 'package:advella/listviews/services_categories.dart';
import 'package:advella/listviews/services_trending.dart';
import 'package:advella/models/category.dart';
import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:flutter/material.dart';

class BrowseServices extends StatefulWidget {

  var trendingServices = <OldService>[];
  var trendingProducts = <OldProduct>[];
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

          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
            child: Row(
              children: <Widget>[
                Text(
                  'Explore more',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                new Spacer(),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,child: ServicesCategories(widget.categories)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Divider(thickness: 1,),
          ),
        ],
      ),
    );
  }
}
