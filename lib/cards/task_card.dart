import 'package:advella/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskCard extends StatelessWidget {

  final Task task;


  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/taskDetail'),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on_outlined,
                          size: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          task.location,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('${task.img1}'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('${task.img2}'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('${task.img3}'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              new Spacer(),
              Container(
                height: 85,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: VerticalDivider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                        child: SvgPicture.asset(
                          'assets/icons/money.svg',
                          height: 20,
                          width: 20,
                          color: Colors.grey[900],
                        ),
                      ),
                      Text(
                        task.price,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 53, 0),
                        child: SvgPicture.asset(
                          'assets/icons/chronometer.svg',
                          height: 20,
                          width: 20,
                          color: Colors.grey[900],
                        ),
                      ),
                      Text(
                        task.duration,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
                        child: SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          height: 20,
                          width: 20,
                          color: Colors.grey[900],
                        ),
                      ),
                      Text(
                        task.dueDate,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: <Widget>[
//       Text(
//         task.title,
//       ),
//       Text(
//         task.location,
//       ),
//       Text(
//         task.price,
//       ),
//       Text(
//         task.duration,
//       ),
//       Text(
//         task.dueDate,
//       ),
//     ],
// ),
