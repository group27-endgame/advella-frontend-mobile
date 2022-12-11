import 'package:advella/models/service.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../viewmodels/service_viewmodel.dart';

class ServicesTrending extends StatefulWidget {

  var trendingServices = <Service>[];

  ServicesTrending(this.trendingServices);

  @override
  _ServicesTrendingState createState() => _ServicesTrendingState();
}

class _ServicesTrendingState extends State<ServicesTrending> {

  String url = 'https://api.advella.popal.dev/content';

  int? _moneyAmount;
  final serviceViewModel = ServiceViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.trendingServices.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if(widget.trendingServices.length == 0) {
          return Container(
            child: Center(
              child: Text('No trending services'),
            ),
          );
        }
        else {
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 15, 20),
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.trendingServices[index].serviceImages == null ?
                  AssetImage(
                    widget.trendingServices[index].serviceId % 2 == 0 ? "assets/images/phone_repair.jpg" : "assets/images/grass2.jpg",
                  ) :
                  NetworkImage('$url${widget.trendingServices[index].serviceImages!.path}') as ImageProvider,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.trendingServices[index].title + '\n' +
                      '${widget.trendingServices[index].moneyAmount} kr' + '\n' +
                      widget.trendingServices[index].location,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            back: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    Text(
                      '${widget.trendingServices[index].detail}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]
                      ),
                    ),
                    new Spacer(),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => chatDialog(context, widget.trendingServices[index]),
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
                        onPressed: () => bidDialog(context, widget.trendingServices[index]),
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
            ),
          );
        }
      },
    );
  }

  void bidDialog(BuildContext context, Service service) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Bid the amount'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                Text(
                  'Listed amount: ${service.moneyAmount} kr',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: TextFormField(
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
                ),
                ElevatedButton(
                  onPressed: () async {
                    print('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii ${_moneyAmount}');

                    await serviceViewModel?.bidService(service.serviceId, _moneyAmount!);

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
                    '${service.userPosted.userName}',
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen(service.userPosted.userId, service.userPosted.userName)),
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
}
