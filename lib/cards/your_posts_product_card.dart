import 'package:another_flushbar/flushbar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/product.dart';
import '../models/user_model.dart';
import '../screens/bottom_nav_bar.dart';
import '../viewmodels/product_viewmodel.dart';

class YourPostsProductCard extends StatefulWidget {

  var products = <Product>[];

  YourPostsProductCard(this.products);

  @override
  State<YourPostsProductCard> createState() => _YourPostsProductCardState();
}

class _YourPostsProductCardState extends State<YourPostsProductCard> {

  String url = 'https://api.advella.popal.dev/content';

  int? _moneyAmount;

  final productViewModel = ProductViewModel();

  String? userName, userEmail, description;
  int? userId, amount;

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
                    onFlip: () async {
                      await productViewModel.getHighestBidder(widget.products[index].productId);
                      setState(() {
                        userName = productViewModel.highestBidder?.userName;
                        userEmail = productViewModel.highestBidder?.userEmail;
                        userId = productViewModel.highestBidder?.userId;
                        description = productViewModel.highestBidder?.description;
                        amount = productViewModel.amount;
                      });
                    },
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 180,
                            height: 180,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Top Bidder',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.products[index].moneyAmount} kr',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800]
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Text(
                                            '${userName}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '$userEmail',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: ElevatedButton(
                                            onPressed: (){
                                              chatDialog(context, widget.products[index]);
                                            },
                                            child: Text(
                                                'Chat'
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.pink),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
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
                              onPressed: () async {
                                await productViewModel.getAllBiddersProduct(widget.products[index].productId);
                                seeAllBiddersDialog(context, productViewModel.bidders);
                              },
                              child: Text(
                                  'See all bidders'
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
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
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () => statusDialog(context, widget.products[index]),
                                  child: Text(
                                      'Set status'
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.green),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => deleteDialog(context, widget.products[index]),
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.red,
                                    size: 30,
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
              }
          ),
        ),
      ],
    );
  }

  void seeAllBiddersDialog(BuildContext context, List<UserModel> bidders) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('All bidders'),
        children: <Widget>[
          SimpleDialogOption(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: bidders.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) => Divider(thickness: 10,),
              itemBuilder: (context, index) {
                if(bidders.length == 0) {
                  return Container(
                    child: Center(
                      child: Text('No posts exist'),
                    ),
                  );
                }
                else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${bidders[index].userName}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${bidders[index].userEmail}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                          new Spacer(),
                          ElevatedButton(
                            onPressed: (){},
                            child: Text(
                                'Chat'
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.pink),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      );
    },
  );

  void deleteDialog(BuildContext context, Product product) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Delete product'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                      size: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Are you sure you want to delete this product?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavBar()),
                            );
                          },
                          child: Text(
                              'No, keep'
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await productViewModel.deleteProduct(product.productId);

                            await Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title: 'Deleted',
                              message: 'This product was deleted successfully',
                              duration: Duration(seconds: 2),
                            ).show(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavBar()),
                            );
                          },
                          child: Text(
                              'Yes, delete'
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );

  void statusDialog(BuildContext context, Product product) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Set status of product'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Open the product if there is something more to be done with this product',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await productViewModel.openProduct(product.productId);

                        await Flushbar(
                          flushbarPosition: FlushbarPosition.TOP,
                          title: 'Opened',
                          message: 'This product was opened successfully',
                          duration: Duration(seconds: 2),
                        ).show(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavBar()),
                        );
                      },
                      child: Text(
                          'Open'
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                          size: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Close the product if the service is completed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await productViewModel.closeProduct(product.productId);

                            await Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title: 'Closed',
                              message: 'This product was closed successfully',
                              duration: Duration(seconds: 2),
                            ).show(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavBar()),
                            );
                          },
                          child: Text(
                              'Close'
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );

  void chatDialog(BuildContext context, Product product) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Chat with the bidder'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                  radius: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '${userName}',
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
                    '${userEmail}',
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
                    '${description}',
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
