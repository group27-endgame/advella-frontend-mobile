import 'package:advella/models/product.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatefulWidget {

  var products = <Product>[];

  ProductCard(this.products);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        if (widget.products.length == 0) {
          return Container(
            child: Center(
              child: Text(
                'No products to show',
              ),
            ),
          );
        }
        else {
          return FlipCard(
            direction: FlipDirection.VERTICAL,
            front: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.products[index].image,
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
                          widget.products[index].title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),

                        Text(
                          widget.products[index].price,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],

                          ),
                        ),
                        Text(
                          widget.products[index].location,
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


            back: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              widget.products[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3, right: 6.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/money.svg',
                                          height: 15,
                                          width: 15,
                                          color: Colors.grey[900],
                                        ),
                                      ),
                                      Text(
                                        '${widget.products[index].price}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800]
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 6.0),
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        '${widget.products[index].location}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3, right: 6.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/calendar.svg',
                                          height: 13,
                                          width: 13,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Text(
                                        '22-12-2022',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text(
                        'Bid'
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          );
        }
      }
    );
  }
}
    // return SafeArea(
    //   child: GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //     ),
    //     itemCount: widget.products.length,
    //     itemBuilder: (context, index) {
    //       if(widget.products.length == 0)
    //         {
    //           return Container(
    //             child: Center(
    //               child: Text(
    //                 'No products to show',
    //               ),
    //             ),
    //           );
    //         }
    //       else
    //         {
    //           return GridTile(
    //             child: Image.asset(
    //               widget.products[index].image,
    //               fit: BoxFit.cover,
    //             ),
    //             footer: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
    //                   child: Stack(
    //                     children: <Widget>[
    //                       Text(
    //                         widget.products[index].title,
    //                         style: TextStyle(
    //                           fontSize: 16,
    //                           decorationColor: Colors.white,
    //                           //color: Colors.white,
    //                           foreground: Paint()
    //                             ..style = PaintingStyle.stroke
    //                             ..strokeWidth = 0.8
    //                             ..color = Colors.black,
    //                         ),
    //                       ),
    //                       Text(
    //                         widget.products[index].title,
    //                         style: TextStyle(
    //                           fontSize: 16,
    //                           decorationColor: Colors.white,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ]
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
    //                   child: Text(
    //                     widget.products[index].price,
    //                     style: TextStyle(
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
    //                   child: Text(
    //                     widget.products[index].location,
    //                     style: TextStyle(
    //                       fontSize: 11,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //           // return Padding(
    //           //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    //           //   child: Container(
    //           //     child: Column(
    //           //       crossAxisAlignment: CrossAxisAlignment.start,
    //           //       children: <Widget>[
    //           //         ClipRRect(
    //           //           borderRadius: BorderRadius.circular(12),
    //           //           child: Image.asset(
    //           //               widget.products[index].image,
    //           //           ),
    //           //         ),
    //           //         Padding(
    //           //           padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
    //           //           child: Text(
    //           //             widget.products[index].title,
    //           //             style: TextStyle(
    //           //               fontSize: 15,
    //           //             ),
    //           //           ),
    //           //         ),
    //           //         Padding(
    //           //           padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
    //           //           child: Text(
    //           //             widget.products[index].price,
    //           //             style: TextStyle(
    //           //               fontSize: 12,
    //           //             ),
    //           //           ),
    //           //         ),
    //           //         Padding(
    //           //           padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
    //           //           child: Text(
    //           //             widget.products[index].location,
    //           //             style: TextStyle(
    //           //               fontSize: 10,
    //           //               color: Colors.grey[700],
    //           //             ),
    //           //           ),
    //           //         ),
    //           //       ],
    //           //     ),
    //           //   ),
    //           // );
    //         }
    //     },
    //   ),
    // );
