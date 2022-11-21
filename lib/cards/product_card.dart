import 'package:advella/models/product.dart';
import 'package:advella/models/product_category.dart';
import 'package:advella/models/service_category.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatefulWidget {

  var products = <Product>[];
  var categories = <ProductCategory>[];

  ProductCard(this.products, this.categories);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  var bidScrollAmountList = new List<int>.generate(1000, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7, left: 20, right: 18),
          child: Row(
            children: [
              Text(
                'Recently posted',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              new Spacer(),
              IconButton(
                icon: Icon(Icons.filter_alt_outlined),
                color: Colors.grey,
                onPressed: () => categoryDialog(context, widget.categories),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
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
                            onPressed: () => bidDialog(context, widget.products[index]),
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
          ),
        ),
      ],
    );
  }

  void categoryDialog(BuildContext context, List<ProductCategory> categories) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Choose a category'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    physics: FixedExtentScrollPhysics(),
                    diameterRatio: 1.0,
                    useMagnifier: true,
                    magnification: 1.5,
                    childDelegate: ListWheelChildBuilderDelegate(
                        childCount: categories.length,
                        builder: (BuildContext context, int index) {
                          if (categories.isEmpty) {
                            return Container(
                              child: Center(
                                child: Text('No categories exist'),
                              ),
                            );
                          }
                          else
                          {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13, bottom: 5),
                                child: Text(
                                  '${categories[index].title}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Choose category',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );

  void bidDialog(BuildContext context, Product product) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Bid the amount'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                Text(
                  'Listed amount: ${product.price}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  height: 375,
                  width: double.infinity,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 60,
                    physics: FixedExtentScrollPhysics(),
                    diameterRatio: 1.0,
                    useMagnifier: true,
                    magnification: 1.5,
                    childDelegate: ListWheelChildBuilderDelegate(
                        childCount: bidScrollAmountList.length,
                        builder: (BuildContext context, int index) {
                          if (bidScrollAmountList.isEmpty) {
                            return Container(
                              child: Center(
                                child: Text('No money amount exist'),
                              ),
                            );
                          }
                          else
                          {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13, bottom: 5),
                                child: Text(
                                  '${bidScrollAmountList[index]} kr',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bid',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
