import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostTaskScreen extends StatefulWidget {
  const PostTaskScreen({Key? key}) : super(key: key);

  @override
  _PostTaskScreenState createState() => _PostTaskScreenState();
}

class _PostTaskScreenState extends State<PostTaskScreen> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
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
              SizedBox(height: 5,),
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5,
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/deliverySubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_delivery.svg"),
                                  SizedBox(height: 5,),
                                  Text("Delivery", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/petSitterSubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_pets.svg"),
                                  SizedBox(height: 5,),
                                  Text("Pet Sitter", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/cleaningSubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_cleaning.svg"),
                                  SizedBox(height: 5,),
                                  Text("Cleaning", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/grocerySubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_shopping.svg"),
                                  SizedBox(height: 5,),
                                  Text("Grocery Shopping", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/gardeningSubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_gardening.svg"),
                                  SizedBox(height: 5,),
                                  Text("Gardening", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/furnitureSubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_furniture.svg"),
                                  SizedBox(height: 5,),
                                  Text("Furniture Assembly", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/driverSubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_driver.svg"),
                                  SizedBox(height: 5,),
                                  Text("Driver", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 160,
                          // decoration: new BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey,
                          //           blurRadius: 5
                          //       ),
                          //     ]
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/laundrySubcategory'),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/icon_laundry.svg"),
                                  SizedBox(height: 5,),
                                  Text("Laundry", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}