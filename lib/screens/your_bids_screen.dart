import 'package:advella/cards/your_bids_service_card.dart';
import 'package:advella/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/product_card.dart';
import '../cards/service_card.dart';
import '../models/product_category.dart';
import '../models/service_category.dart';
import '../viewmodels/category_viewmodel.dart';
import '../viewmodels/product_viewmodel.dart';
import '../viewmodels/service_viewmodel.dart';
import 'add_product_screen.dart';
import 'add_service_screen.dart';
import 'browse_services.dart';

class YourBidsScreen extends StatefulWidget {
  const YourBidsScreen({Key? key}) : super(key: key);

  @override
  _YourBidsScreenState createState() => _YourBidsScreenState();
}

class _YourBidsScreenState extends State<YourBidsScreen>  with TickerProviderStateMixin{

  List<OldProduct> products = [
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('House for sale', '60000 kr.', 'Lunderskov, 3030', 'assets/images/grass2.jpg'),
    OldProduct('Bicycle', '250 kr.', 'Horsens, 8700', 'assets/images/bike5.jpg'),
    OldProduct('IKEA closet', '1500 kr.', 'Copenhagen, 1500', 'assets/images/closet5.jpg'),
    OldProduct('Lian li pc', '10500 kr.', 'Kolding, 6800', 'assets/images/lian-li-pc.jpg'),
    OldProduct('Original Porsche Macan', '110000 kr.', 'Horsens, 8700', 'assets/images/porsche.jpg'),
    OldProduct('Rustic cabinet', '65 kr.', 'Vejen, 6600', 'assets/images/cabinet.jpg'),
    OldProduct('Nike Dunk Low Black/White', '1499 kr.', 'Horsens, 8700', 'assets/images/nike.jpg'),
    OldProduct('Study table with adjustable height', '600 kr.', 'Silkeborg, 9800', 'assets/images/table.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('ya cheeky wanker'),
    );
  }
    // TabController _tabController = TabController(length: 2, vsync: this);
    //
    // return Consumer3<ServiceViewModel, ProductViewModel, CategoryViewModel>(
    //     builder: (context, serviceViewModel, productViewModel, categoryViewModel, child) {
    //       return Scaffold(
    //         body: SafeArea(
    //           child: Container(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Container(
    //                   padding: const EdgeInsets.only(top: 10, left: 20),
    //                   child: Row(
    //                     children: <Widget>[
    //                       Container(
    //                         padding: const EdgeInsets.only(top: 5, left: 0),
    //                         child: Text(
    //                           'Your Bids',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 25,
    //                           ),
    //                         ),
    //                       ),
    //                       new Spacer(),
    //                       Container(
    //                         margin: const EdgeInsets.only(right: 20),
    //                         width: 45,
    //                         height: 45,
    //                         child: ClipRRect(
    //                           borderRadius: BorderRadius.circular(10),
    //                           child: Image.asset('assets/images/profile_pic.png'),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //
    //                 Container(
    //                   child: Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: TabBar(
    //                       labelPadding: const EdgeInsets.only(left: 20, right: 20),
    //                       controller: _tabController,
    //                       labelColor: Colors.black,
    //                       unselectedLabelColor: Colors.grey,
    //                       isScrollable: true,
    //                       indicatorSize: TabBarIndicatorSize.label,
    //                       indicator: CircleTabIndicator(
    //                           color: Colors.blueAccent, radius: 4),
    //                       tabs: [
    //                         Tab(text: 'Services'),
    //                         Tab(text: 'Products'),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
    //                   height: 569,
    //                   width: double.maxFinite,
    //                   child: TabBarView(
    //                     controller: _tabController,
    //                     children: [
    //                       FutureBuilder(
    //                           future: Future.wait([
    //                             serviceViewModel.getAllServices(),
    //                             categoryViewModel.getAllServiceCategories()
    //                           ]),
    //                           builder:
    //                               (BuildContext context, AsyncSnapshot snapshot) {
    //                             if (serviceViewModel.services.length == 0) {
    //                               return Container(
    //                                 child: Center(
    //                                   child: CircularProgressIndicator(),
    //                                   //Text('No bookings exist'),
    //                                 ),
    //                               );
    //                             } else {
    //                               return YourBidsServiceCard(serviceViewModel.services, categoryViewModel.serviceCategories);
    //                             }
    //                           }),
    //
    //                       FutureBuilder(
    //                           future: Future.wait([
    //                             productViewModel.getAllProducts(),
    //                             categoryViewModel.getAllProductCategories()
    //                           ]),
    //                           builder:
    //                               (BuildContext context, AsyncSnapshot snapshot) {
    //                             if (categoryViewModel.productCategories.isEmpty) {
    //                               return Container(
    //                                 child: Center(
    //                                   child: CircularProgressIndicator(),
    //                                   //Text('No bookings exist'),
    //                                 ),
    //                               );
    //                             } else {
    //                               return ProductCard(productViewModel.products, categoryViewModel.productCategories);
    //                             }
    //                           }),
    //                     ],
    //                   ),
    //                 ),
    //                 /////////////////////////////////// Expanded(child: PostCard(posts)),
    //               ],
    //             ),
    //           ),
    //         ),
    //         floatingActionButton: FloatingActionButton(
    //           child: Icon(Icons.add),
    //           onPressed: () => addPostDialog(context, categoryViewModel.serviceCategories, categoryViewModel.productCategories),
    //         ),
    //       );
    //     });
  }

//   void addPostDialog(BuildContext context, List<ServiceCategory> serviceCategories, List<ProductCategory> productCategories) => showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return SimpleDialog(
//         title: const Text('Post'),
//         children: <Widget>[
//           SimpleDialogOption(
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/gifs/add-service-gif.gif',
//                   height: 130,
//                   width: 130,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5, bottom: 10),
//                   child: Text(
//                     'Post a service listing if you need help for a service',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddServiceScreen(serviceCategories)),
//                   ),
//                   child: Text('Post Service'),
//                   style: ButtonStyle(
//                     shape:
//                     MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: Container(
//                     width: 180,
//                     child: Divider(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/gifs/add-product-gif.gif',
//                   height: 180,
//                   width: 180,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5, bottom: 10),
//                   child: Text(
//                     'Post a product listing if you need to sell a product',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddProductScreen(productCategories)),
//                   ),
//                   child: Text('Post Product'),
//                   style: ButtonStyle(
//                     shape:
//                     MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     },
//   );


// class CircleTabIndicator extends Decoration {
//   final Color color;
//   double radius;
//
//   CircleTabIndicator({required this.color, required this.radius});
//
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     // TODO: implement createBoxPainter
//     return _CirclePainter(color: color, radius: radius);
//   }
// }
//
// class _CirclePainter extends BoxPainter {
//   final Color color;
//   double radius;
//
//   _CirclePainter({required this.color, required this.radius});
//
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     Paint _paint = Paint();
//     _paint.color = color;
//     _paint.isAntiAlias = true;
//     final Offset circleOffset = Offset(
//         configuration.size!.width / 2 - radius / 2,
//         configuration.size!.height - 10);
//     canvas.drawCircle(offset + circleOffset, radius, _paint);
//   }
// }