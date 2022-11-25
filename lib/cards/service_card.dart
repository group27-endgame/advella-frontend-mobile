import 'package:advella/models/service.dart';
import 'package:advella/models/service_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesCard extends StatefulWidget {

  var services = <Service>[];
  var categories = <ServiceCategory>[];
  //var categoryTitles = <String>[];

  ServicesCard(this.services, this.categories);

  @override
  _ServicesCardState createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {

  int likeColorIncrement = 0;
  bool likeColorBlue = false;

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
              new Spacer(),
              IconButton(
                icon: Icon(Icons.filter_alt_outlined),
                color: Colors.grey,
                onPressed: () => categoryDialog(context, widget.categories),
              ),
              // SizedBox(
              //   width: 140,
              //   height: 60,
              //   child: DropdownButtonFormField<String>(
              //     decoration: InputDecoration(
              //       labelText: 'Category',
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide(
              //           width: 2,
              //           color: Colors.blueAccent,
              //         ),
              //       )
              //     ),
              //     value: selectedItem,
              //     items: widget.categoryTitles.map((item) => DropdownMenuItem<String>(
              //       value: item,
              //       child: Text(item),
              //     )).toList(),
              //     onChanged: (item) => setState(() => selectedItem = (item) as String),
              //   ),
              // ),
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
                          widget.services[index].serviceImages == null ?
                          Image.asset(
                           widget.services[index].serviceId % 2 == 0 ? "assets/images/phone_repair.jpg" : "assets/images/grass2.jpg",
                          ) : 
                          Image.network('$url${widget.services[index].serviceImages!.path}'),
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
                            padding: const EdgeInsets.fromLTRB(30, 2, 30, 10),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                        child: Icon(
                                          Icons.thumb_up_alt_outlined,
                                          size: 18,
                                          color: likeColorBlue ? Colors.blue : Colors.grey[700],
                                        ),
                                      ),
                                      Text(
                                        'Like',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: likeColorBlue ? Colors.blue : Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      likeColorIncrement++;

                                      if(likeColorIncrement % 2 == 0)
                                        {
                                          likeColorBlue = false;
                                        }
                                      else
                                        {
                                          likeColorBlue = true;
                                        }
                                    });
                                  },
                                ),

                                new Spacer(),
                                GestureDetector(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                        child: Icon(
                                          Icons.mode_comment_outlined,
                                          size: 18,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      Text(
                                        'Chat',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () => chatDialog(context, widget.services[index]),
                                ),
                                new Spacer(),
                                GestureDetector(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                        child: SvgPicture.asset(
                                          'assets/icons/payment.svg',
                                          width: 18,
                                          height: 18,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      Text(
                                        'Bid',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () => bidDialog(context, widget.services[index]),
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

  void categoryDialog(BuildContext context, List<ServiceCategory> categories) => showDialog(
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
                              color: Colors.blue[50],
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
