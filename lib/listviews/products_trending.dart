import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../viewmodels/product_viewmodel.dart';

class ProductsTrending extends StatefulWidget {

  var trendingProducts = <Product>[];

  ProductsTrending(this.trendingProducts);

  @override
  State<ProductsTrending> createState() => _ProductsTrendingState();
}

class _ProductsTrendingState extends State<ProductsTrending> {

  String url = 'https://api.advella.popal.dev/content';

  int? _moneyAmount;
  final productViewModel = ProductViewModel();

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
              child: Text('No trending products'),
            ),
          );
        }
        else {
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: Container(
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
                        image: widget.trendingProducts[index].productImage == null ?
                        AssetImage(
                          widget.trendingProducts[index].productId % 2 == 0 ? 'assets/images/closet5.jpg' : 'assets/images/porsche.jpg',
                        ) :
                        NetworkImage('$url${widget.trendingProducts[index].productImage!.path}') as ImageProvider,

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
                          '${widget.trendingProducts[index].moneyAmount} kr',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[700],

                          ),
                        ),
                        Text(
                          widget.trendingProducts[index].pickUpLocation,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: Text(
                        '${widget.trendingProducts[index].detail}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => chatDialog(context, widget.trendingProducts[index]),
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
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => bidDialog(context, widget.trendingProducts[index]),
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
      },
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
                    '${product.userPosted.userName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen(product.userPosted.userId, product.userPosted.userName)),
                  ),
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
