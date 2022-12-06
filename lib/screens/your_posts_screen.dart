import 'package:advella/cards/task_card.dart';
import 'package:advella/cards/your_posts_product_card.dart';
import 'package:advella/cards/your_posts_service_card.dart';
import 'package:advella/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/product_card.dart';
import '../cards/your_bids_service_card.dart';
import '../models/product_category.dart';
import '../models/service_category.dart';
import '../models/user_model.dart';
import '../services/local_storage/localstorage_user_service.dart';
import '../viewmodels/category_viewmodel.dart';
import '../viewmodels/product_viewmodel.dart';
import '../viewmodels/service_viewmodel.dart';
import 'add_product_screen.dart';
import 'add_service_screen.dart';

class YourPostsScreen extends StatefulWidget {
  const YourPostsScreen({Key? key}) : super(key: key);

  @override
  _YourPostsScreenState createState() => _YourPostsScreenState();
}

class _YourPostsScreenState extends State<YourPostsScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context)  {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Consumer3<ServiceViewModel, ProductViewModel, CategoryViewModel>(
        builder: (context, serviceViewModel, productViewModel, categoryViewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 5, left: 0),
                            child: Text(
                              'Your Posts',
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
                      height: 10,
                    ),

                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelPadding: const EdgeInsets.only(left: 20, right: 20),
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: CircleTabIndicator(
                              color: Colors.blueAccent, radius: 4),
                          tabs: [
                            Tab(text: 'Services'),
                            Tab(text: 'Products'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      height: 569,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          FutureBuilder(
                              future: Future.wait([
                                serviceViewModel.getServicesPostedByUser(),
                              ]),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (serviceViewModel.servicesPostedByUser.length == 0) {
                                  return Container(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                      //Text('No bookings exist'),
                                    ),
                                  );
                                } else {
                                  print("oooooooooooooooooooooo ${serviceViewModel.servicesPostedByUser[0].title}");
                                  return YourPostsServiceCard(serviceViewModel.servicesPostedByUser);
                                }
                              }),

                          FutureBuilder(
                              future: Future.wait([
                                productViewModel.getProductsPostedByUser(),
                              ]),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (categoryViewModel.productCategories.isEmpty) {
                                  return Container(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                      //Text('No bookings exist'),
                                    ),
                                  );
                                } else {
                                  return YourPostsProductCard(productViewModel.productsPostedByUser);
                                }
                              }),
                        ],
                      ),
                    ),
                    /////////////////////////////////// Expanded(child: PostCard(posts)),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => addPostDialog(context, categoryViewModel.serviceCategories, categoryViewModel.productCategories),
            ),
          );
        });
  }

  void addPostDialog(BuildContext context, List<ServiceCategory> serviceCategories, List<ProductCategory> productCategories) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Post'),
        children: <Widget>[
          SimpleDialogOption(
            child: Column(
              children: [
                Image.asset(
                  'assets/gifs/add-service-gif.gif',
                  height: 130,
                  width: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    'Post a service listing if you need help for a service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddServiceScreen(serviceCategories)),
                  ),
                  child: Text('Post Service'),
                  style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 180,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/gifs/add-product-gif.gif',
                  height: 180,
                  width: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    'Post a product listing if you need to sell a product',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProductScreen(productCategories)),
                  ),
                  child: Text('Post Product'),
                  style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
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

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - 10);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
  // int? _value = 1;
  //
  // List<Task> tasks = [
  //   Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021', img1: 'assets/images/bike4.jpg', img2: 'assets/images/bike5.jpg', img3: 'assets/images/bike6.jpg'),
  //   Task(title: 'IKEA closet assembly', location: 'Aarhus, 8800',price: '280 DKK', duration: '7 hour', dueDate: '26/09/2021', img1: 'assets/images/closet4.jpg', img2: 'assets/images/closet5.jpg', img3: 'assets/images/closet6.jpg'),
  //   Task(title: 'Mow lawn and trim hedges', location: 'Vejen, 6600',price: '310 DKK', duration: '9 hour', dueDate: '21/09/2021', img1: 'assets/images/grass1.jpg', img2: 'assets/images/grass2.jpg', img3: 'assets/images/grass3.jpg'),
  //   ];
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               TextButton(
  //                 onPressed: (){},
  //                 child: Text("Helpie", style: TextStyle(fontWeight: FontWeight.bold),),
  //                 style: TextButton.styleFrom(
  //                   primary: Colors.black,
  //                 ),
  //               ),
  //               Container(
  //                 width: 80,
  //                 child: Divider(
  //                   color: Colors.grey[700],
  //                 ),
  //               ),
  //               TextButton(
  //                 onPressed: (){},
  //                 child: Text("Helper", style: TextStyle(fontWeight: FontWeight.normal),),
  //                 style: TextButton.styleFrom(
  //                   primary: Colors.black,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //             child: Row(
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
  //                   child: DropdownButtonHideUnderline(
  //                     child: DropdownButton(
  //                       value: _value,
  //                       style: TextStyle(
  //                         color: Colors.grey,
  //                       ),
  //                       items: [
  //                         DropdownMenuItem(
  //                           child: Text("Ongoing"),
  //                           value: 1,
  //                         ),
  //                         DropdownMenuItem(
  //                           child: Text("History"),
  //                           value: 2,
  //                         ),
  //                       ],
  //                       onChanged: (int? value) {
  //                         setState(() {
  //                           _value = value;
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //                 new Spacer(),
  //                 IconButton(
  //                   onPressed: () => Navigator.of(context).pushNamed('/filter'),
  //                   icon: Icon(Icons.filter_alt_outlined),
  //                   color: Colors.grey,
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Expanded(
  //             child: ListView(
  //               children: tasks.map((task) => TaskCard(
  //                 task: task,
  //               )).toList(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
