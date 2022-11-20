import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:flutter/material.dart';

class ProductsTrending extends StatefulWidget {

  var trendingProducts = <Product>[];

  ProductsTrending(this.trendingProducts);

  @override
  State<ProductsTrending> createState() => _ProductsTrendingState();
}

class _ProductsTrendingState extends State<ProductsTrending> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.trendingProducts.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if(widget.trendingProducts.length == 0) {
          return Container(
            child: Center(
              child: Text('No trending services'),
            ),
          );
        }
        else {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/taskDetail');
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.trendingProducts[index].image,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.trendingProducts[index].title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),

                        Text(
                          widget.trendingProducts[index].price,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[700],

                          ),
                        ),
                        Text(
                          widget.trendingProducts[index].location,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
