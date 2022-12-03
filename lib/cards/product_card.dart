import 'package:advella/models/product.dart';
import 'package:advella/models/product_category.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/viewmodels/product_viewmodel.dart';
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

  String url = 'https://api.advella.popal.dev/content';

  int? _moneyAmount;

  final productViewModel = ProductViewModel();

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
              childAspectRatio: 0.60
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
                                image: widget.products[index].productImage == null ?
                                AssetImage(
                                  widget.products[index].productId % 2 == 0 ? 'assets/images/closet5.jpg' : 'assets/images/porsche.jpg',
                                ) :
                                NetworkImage('$url${widget.products[index].productImage!.path}') as ImageProvider,

                              ),
                            ),
                          ),
                        Container(
                          height: 67,
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
                                '${widget.products[index].moneyAmount} kr',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey[700],

                                ),
                              ),
                              Text(
                                widget.products[index].pickUpLocation,
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
                                              '${widget.products[index].moneyAmount} kr',
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
                                              '${widget.products[index].pickUpLocation}',
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
                          margin: const EdgeInsets.only(top: 5),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => chatDialog(context, widget.products[index]),
                            child: Text(
                                'Chat'
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.pinkAccent,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
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

  void chatDialog(BuildContext context, Product product) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Chat with the poster'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                  radius: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    '${product.userPosted.userEmail}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    '${product.userPosted.description}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text(
                      'Start chatting'
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
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
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
                  'Listed amount: ${product.moneyAmount} kr',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  onChanged: (moneyAmount){
                    setState(() {
                      _moneyAmount = int.parse(moneyAmount);

                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Price in DKK"
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await productViewModel.bidProduct(product.productId, _moneyAmount!);
                    Navigator.of(context).pop();
                  },
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
