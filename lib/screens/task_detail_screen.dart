import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey[400],
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Need to fix bike',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                      radius: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Nitin Arora',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    new Spacer(),
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            'Created',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                        ),
                        Text(
                            '20/09/2021',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                //width: double.infinity,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/money.svg',
                    height: 20,
                    width: 20,
                    color: Colors.grey[900],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Text(
                      '200 DKK',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: VerticalDivider(
                      color: Colors.grey,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    height: 20,
                    width: 20,
                    color: Colors.grey[900],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text(
                      'Horsens, 8700',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                //width: double.infinity,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    height: 20,
                    width: 20,
                    color: Colors.grey[900],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(42, 0, 38, 0),
                    child: Text(
                      '27/09/2021',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: VerticalDivider(
                      color: Colors.grey,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/chronometer.svg',
                    height: 20,
                    width: 20,
                    color: Colors.grey[900],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                    child: Text(
                      '1 hour',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                //width: double.infinity,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/bike4.jpg'),
                      radius: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/bike5.jpg'),
                        radius: 35,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/bike6.jpg'),
                      radius: 35,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'I need to fix all these bikes on the pictures, so I can resell them and get more money than I will pay you,  monkeys. I stole the bikes and now I am gonna do profit on it.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/horsensLocation2.png',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Container(
                  //width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Questions',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/nitin1.jpg'),
                        radius: 18,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Do you have any questions?',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => deductionDialog(context),
        child: SvgPicture.asset(
          'assets/icons/payment.svg',
          width: 30,
          height: 30,
          color: Colors.white,
        ),
        //backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }



  void deductionDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Calculation'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Task amount'),
                    new Spacer(),
                    Text('200 DKK'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          'Deduction'),
                      new Spacer(),
                      Text('20 DKK',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('Earning'),
                    new Spacer(),
                    Text('180 DKK',
                      style: TextStyle(
                        color: Colors.green,
                      ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {Navigator.pop(context);},
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {Navigator.pop(context);},
                      child: const Text(
                        'CONFIRM',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SimpleDialogOption(
          //   onPressed: () {Navigator.pop(context);},
          //   child: Text('oiefhoef'),
          // ),
        ],
      );
    },
  );
}