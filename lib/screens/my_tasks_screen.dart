import 'package:advella/cards/task_card.dart';
import 'package:advella/models/task.dart';
import 'package:flutter/material.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  _MyTasksScreenState createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {

  int? _value = 1;

  List<Task> tasks = [
    Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021', img1: 'assets/images/bike4.jpg', img2: 'assets/images/bike5.jpg', img3: 'assets/images/bike6.jpg'),
    Task(title: 'IKEA closet assembly', location: 'Aarhus, 8800',price: '280 DKK', duration: '7 hour', dueDate: '26/09/2021', img1: 'assets/images/closet4.jpg', img2: 'assets/images/closet5.jpg', img3: 'assets/images/closet6.jpg'),
    Task(title: 'Mow lawn and trim hedges', location: 'Vejen, 6600',price: '310 DKK', duration: '9 hour', dueDate: '21/09/2021', img1: 'assets/images/grass1.jpg', img2: 'assets/images/grass2.jpg', img3: 'assets/images/grass3.jpg'),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){},
                  child: Text("Helpie", style: TextStyle(fontWeight: FontWeight.bold),),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
                Container(
                  width: 80,
                  child: Divider(
                    color: Colors.grey[700],
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: Text("Helper", style: TextStyle(fontWeight: FontWeight.normal),),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _value,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text("Ongoing"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("History"),
                            value: 2,
                          ),
                        ],
                        onChanged: (int? value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                  ),
                  new Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pushNamed('/filter'),
                    icon: Icon(Icons.filter_alt_outlined),
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: tasks.map((task) => TaskCard(
                  task: task,
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}