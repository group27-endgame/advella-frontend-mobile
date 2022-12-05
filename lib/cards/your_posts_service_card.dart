import 'package:another_flushbar/flushbar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/service.dart';
import '../models/service_category.dart';
import '../screens/bottom_nav_bar.dart';
import '../viewmodels/service_viewmodel.dart';

class YourPostsServiceCard extends StatefulWidget {
  var services = <Service>[];
  //var categoryTitles = <String>[];

  YourPostsServiceCard(this.services);

  @override
  State<YourPostsServiceCard> createState() => _YourPostsServiceCardState();
}

class _YourPostsServiceCardState extends State<YourPostsServiceCard> {

  int likeColorIncrement = 0;
  bool likeColorBlue = false;

  int? _moneyAmount;
  final serviceViewModel = ServiceViewModel();

  String? userName;
  int? userId, amount;

  String url = 'https://api.advella.popal.dev/content';

  String selectedItem = 'Technology';

  var bidScrollAmountList = new List<int>.generate(1000, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.services.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (BuildContext context, int index) => Divider(thickness: 10,),
            itemBuilder: (context, index) {
              if(widget.services.length == 0) {
                return Container(
                  child: Center(
                    child: Text('No posts exist'),
                  ),
                );
              }
              else {
                return GestureDetector(
                  onTap: () {
                    //Navigator.of(context).pushNamed('/taskDetail');
                  },
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                            'assets/icons/repair.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${widget.services[index].serviceCategory.title} ·', /*${DateTime.fromMillisecondsSinceEpoch(widget.services[index].postedDateTime).*/
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600]
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 10,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                widget.services[index].location,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                new Spacer(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Column(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'assets/icons/money.svg',
                                        height: 13,
                                        width: 13,
                                        color: Colors.grey[700],
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/calendar.svg',
                                        height: 13,
                                        width: 13,
                                        color: Colors.grey[800],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '${widget.services[index].moneyAmount.toString()} kr',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    Text(
                                      '${DateTime.fromMillisecondsSinceEpoch(widget.services[index].deadline).day}-'
                                          '${DateTime.fromMillisecondsSinceEpoch(widget.services[index].deadline).month}-'
                                          '${DateTime.fromMillisecondsSinceEpoch(widget.services[index].deadline).year}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Text(
                              widget.services[index].title,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text(
                              widget.services[index].detail,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),

                          FlipCard(
                            onFlip: () async {

                              await serviceViewModel.getHighestBidder(widget.services[index].serviceId);
                              setState(() {
                                userName = serviceViewModel.highestBidder?.userName;
                                userId = serviceViewModel.highestBidder?.userId;
                               amount = serviceViewModel.amount;
                              });
                              // await serviceViewModel.getHighestBidder(136);
                            },
                            direction: FlipDirection.VERTICAL,
                            front: widget.services[index].serviceImages == null ? Image.asset(
                              widget.services[index].serviceId % 2 == 0 ? "assets/images/phone_repair.jpg" : "assets/images/grass2.jpg",
                            ) : Image.network('$url${widget.services[index].serviceImages!.path}'),
                            back: Container(
                              child: Column(
                                children: [
                                  Text(
                                      '${userName} $amount'
                                  ),
                                  Text(
                                      'uwefowubfwribfwri'
                                  ),
                                  Text(
                                      'uwefowubfwribfwri'
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '${widget.services[index].numberOfBids} bids',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(thickness: 1,),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: (){
                                    statusDialog(context, widget.services[index]);
                                  },
                                  child: Text(
                                    'Set status',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    statusDialog(context, widget.services[index]);
                                  },
                                  child: Text(
                                    'See all bidders',
                                    style: TextStyle(
                                        color: Colors.blue
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: (){
                                    deleteDialog(context, widget.services[index]);
                                  },
                                  child: Text(
                                      'Delete',
                                    style: TextStyle(
                                      color: Colors.red[300]
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void seeAllBiddersDialog(BuildContext context, Service service) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Delete service'),
        children: <Widget>[
          SimpleDialogOption(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.services.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) => Divider(thickness: 10,),
              itemBuilder: (context, index) {
                if(widget.services.length == 0) {
                  return Container(
                    child: Center(
                      child: Text('No posts exist'),
                    ),
                  );
                }
                else {
                  return Column(
                  );
                }
              },
            ),
          ),
        ],
      );
    },
  );

  void deleteDialog(BuildContext context, Service service) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Delete service'),
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
                        'Are you sure you want to delete this service?',
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
                            await serviceViewModel.deleteService(service.serviceId);

                            await Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title: 'Deleted',
                              message: 'This service was deleted successfully',
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

  void statusDialog(BuildContext context, Service service) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Set status of service'),
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
                          'Open the service if there is something more to be done with this service',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await serviceViewModel.openService(service.serviceId);

                        await Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            title: 'Opened',
                            message: 'This service was opened successfully',
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
                            'Close the service if the service is completed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await serviceViewModel.closeService(service.serviceId);

                            await Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title: 'Closed',
                              message: 'This service was closed successfully',
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

  void chatDialog(BuildContext context, Service service) => showDialog(
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
                    '${service.userPosted.userEmail}',
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
                    '${service.userPosted.description}',
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
}
