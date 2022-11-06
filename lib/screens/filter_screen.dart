import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  double _currentSliderValue = 10;
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;

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
          TextButton(
            onPressed: () {},
            child: Text(
              'Apply',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Location',
                  suffixIcon: Icon(Icons.location_on_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Radius',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: '${_currentSliderValue.round().toString()} KM',
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Price range',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                      ),
                    ),
                    new Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'min',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'max',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Text("General", style: TextStyle(fontWeight: FontWeight.bold),),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  Container(
                    width: 40,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text("Pro", style: TextStyle(fontWeight: FontWeight.normal),),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  Container(
                    width: 40,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text("Quick", style: TextStyle(fontWeight: FontWeight.normal),),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Pet Sitter',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Cleaning',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Grocery Shopping',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Gardening',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Furniture Assembly',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Driver',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
                      ),
                    ),
                    new Spacer(),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked7,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked7 = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Laundry',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900],
                      ),
                    ),
                    new Spacer(),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked8,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked8 = value!;
                        });
                      },
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
}
