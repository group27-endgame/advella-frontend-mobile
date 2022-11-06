import 'package:flutter/material.dart';

class CleaningSubcategoryScreen extends StatefulWidget {
  const CleaningSubcategoryScreen({Key? key}) : super(key: key);

  @override
  _CleaningSubcategoryScreenState createState() => _CleaningSubcategoryScreenState();
}

class _CleaningSubcategoryScreenState extends State<CleaningSubcategoryScreen> {

  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.blue;
    }

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            color: Colors.grey[400],
            onPressed: () => Navigator.of(context).pushNamed('/postTaskDetail'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Cleaning',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Choose subcategories',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Moping',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  new Spacer(),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Sweeping',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  new Spacer(),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Vacuuming',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  new Spacer(),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Dead bodies',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  new Spacer(),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    },
                  ),
                ],
              ),Row(
                children: [
                  Text(
                    'Anus',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  new Spacer(),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked5,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked5 = value!;
                      });
                    },
                  ),
                ],
              ),Row(
                children: [
                  Text(
                    'Dead hookers',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  new Spacer(),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked6,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked6 = value!;
                      });
                    },
                  ),
                ],
              ),
              Image.asset(
                'assets/images/broomGif.gif',
                width: double.infinity,
                height: 250,
              ),
              //Image.network('https://assets.materialup.com/uploads/085ea352-0ce7-4ba1-9afe-e6b23fa5eb73/preview.gif'),
            ],
          ),
        ),
      ),
    );
  }
}
