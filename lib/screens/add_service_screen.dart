import 'dart:io';

import 'package:advella/models/service_category.dart';
import 'package:advella/screens/bottom_nav_bar.dart';
import 'package:advella/screens/browse_screen.dart';
import 'package:advella/viewmodels/service_viewmodel.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddServiceScreen extends StatefulWidget {
  
  var categories = <ServiceCategory>[];
  
  AddServiceScreen(this.categories);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {

  String _title = '', _description='', _location='', _category='';
  int? _duration;
  int? _moneyAmount;

  ServiceCategory? _serviceCategory;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  File? image;

  Future pickImage() async
  {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick imageL $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceViewModel>(
        builder: (context, viewmodel, child) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 0),
                      child: Text(
                        'Post a service',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    new Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 45,
                      height: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/profile_pic.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),

              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  obscureText: false,
                  onChanged: (title){
                    setState(() {
                      _title = title;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Title"
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: TextFormField(
                  obscureText: false,
                  onChanged: (description){
                    setState(() {
                      _description = description;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Description"
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        onChanged: (moneyAmount){
                          // print('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii ${moneyAmount}');
                          // print('ppppppppppppppppppppppppppp ${moneyAmount as int}');
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
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        onChanged: (duration){
                          setState(() {
                            _duration = int.parse(duration);

                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Duration"
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: TextFormField(
                  obscureText: false,
                  onChanged: (location){
                    setState(() {
                      _location = location;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Location"
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 5, right: 10, top: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/calendar.svg",
                        color: Colors.grey,
                      ),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? newStartDate = await showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2024),
                        );

                        if(newStartDate == null) return;

                        setState(() {
                          startDate = newStartDate;

                        });
                        print(startDate);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat(
                                "dd MMMM, yyyy").format(startDate),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => categoryDialog(context, widget.categories),
                        child: Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 175,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => pickImage(),
                  child: image == null ? Text(
                    'Choose an image',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ) : Image.file(image!),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white
                    ),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                        side: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {

                    print('llllllllllllllllllllllllllll ${_moneyAmount}');
                    await viewmodel.postService(_title, _description, _moneyAmount!, _duration!, _location, startDate, _serviceCategory!, image!);

                    await Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      title: 'Success',
                      message: 'Your service listing was posted successfully',
                      duration: Duration(seconds: 3),
                    ).show(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()),
                    );
                  },
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  });
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
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _serviceCategory = categories[index];
                      });
                    },
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
                  onPressed: (){
                    print(_serviceCategory?.title);
                    Navigator.of(context).pop();
                  },
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
}
