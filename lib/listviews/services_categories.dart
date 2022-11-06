import 'package:advella/models/category.dart';
import 'package:flutter/material.dart';

class ServicesCategories extends StatefulWidget {

  var categories = <Category>[];

  ServicesCategories(this.categories);

  @override
  _ServicesCategoriesState createState() => _ServicesCategoriesState();
}

class _ServicesCategoriesState extends State<ServicesCategories> {

  // @override
  // Widget build(BuildContext context) {
  //   return Row(
  //     children: <Widget>[
  //       Column(
  //         children: <Widget>[
  //
  //         ],
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {

          if(widget.categories.length == 0) {
            return Container(
              child: Center(
                child: Text('No trending services'),
              ),
            );
          }

          else {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/taskDetail');
              },
              child: Container(
                padding: const EdgeInsets.only(right: 10, left: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(10),
                        //color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.categories[index].image,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.categories[index].name,
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
        }
    );
  }
}
