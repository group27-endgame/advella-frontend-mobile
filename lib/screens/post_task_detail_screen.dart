import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostTaskDetailScreen extends StatefulWidget {
  const PostTaskDetailScreen({Key? key}) : super(key: key);

  @override
  _PostTaskDetailScreenState createState() => _PostTaskDetailScreenState();
}

class _PostTaskDetailScreenState extends State<PostTaskDetailScreen> {

  DateTime selectedDate = DateTime.now();
  String dueDate = 'Due date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: const Center(
                  child: Text(
                    'Task details',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Task title',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText:
                  '${selectedDate == DateTime.now() ? dueDate : '${selectedDate.toLocal()}'.split(' ')[0]}',
                  //hintText: '${selectedDate.toLocal()}'.split(' ')[0],
                  suffixIcon: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Icon(Icons.date_range_outlined),
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Location',
                  suffixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          ),
                        ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Duration',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  //labelText: 'Description',
                  hintText: 'Description',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Photos',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text(
                    'Post a new task',
                  ),
                  onPressed: () => taskPostedDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void taskPostedDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: Colors.grey[100],
        title: const Text('Task posted!'),
        children: <Widget>[
          Image.asset(
            'assets/images/successfulGif.gif',
            width: 250,
            height: 250,
          ),
        ],
      );
    },
  );
}
