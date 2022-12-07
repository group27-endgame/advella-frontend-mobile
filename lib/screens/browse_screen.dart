import 'package:advella/cards/product_card.dart';
import 'package:advella/cards/service_card.dart';
import 'package:advella/models/category.dart';
import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/models/task.dart';
import 'package:advella/screens/add_product_screen.dart';
import 'package:advella/screens/add_service_screen.dart';
import 'package:advella/viewmodels/category_viewmodel.dart';
import 'package:advella/viewmodels/product_viewmodel.dart';
import 'package:advella/viewmodels/service_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_category.dart';
import 'browse_services.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with TickerProviderStateMixin {
  int? _value = 1;

  List<Task> tasks = [
    Task(
        title: 'Need to fix my bike',
        location: 'Horsens, 8700',
        price: '200 DKK',
        duration: '1 hour',
        dueDate: '27/09/2021',
        img1: 'assets/images/bike4.jpg',
        img2: 'assets/images/bike5.jpg',
        img3: 'assets/images/bike6.jpg'),
    Task(
        title: 'IKEA closet assembly',
        location: 'Aarhus, 8800',
        price: '280 DKK',
        duration: '7 hour',
        dueDate: '26/09/2021',
        img1: 'assets/images/closet4.jpg',
        img2: 'assets/images/closet5.jpg',
        img3: 'assets/images/closet6.jpg'),
    Task(
        title: 'Mow lawn and trim hedges',
        location: 'Vejen, 6600',
        price: '310 DKK',
        duration: '9 hour',
        dueDate: '21/09/2021',
        img1: 'assets/images/grass1.jpg',
        img2: 'assets/images/grass2.jpg',
        img3: 'assets/images/grass3.jpg'),
    Task(
        title: 'Need to fix my bike',
        location: 'Horsens, 8700',
        price: '200 DKK',
        duration: '1 hour',
        dueDate: '27/09/2021',
        img1: 'assets/images/bike4.jpg',
        img2: 'assets/images/bike5.jpg',
        img3: 'assets/images/bike6.jpg'),
    Task(
        title: 'IKEA closet assembly',
        location: 'Aarhus, 8800',
        price: '280 DKK',
        duration: '7 hour',
        dueDate: '26/09/2021',
        img1: 'assets/images/closet4.jpg',
        img2: 'assets/images/closet5.jpg',
        img3: 'assets/images/closet6.jpg'),
    Task(
        title: 'Mow lawn and trim hedges',
        location: 'Vejen, 6600',
        price: '310 DKK',
        duration: '9 hour',
        dueDate: '21/09/2021',
        img1: 'assets/images/grass1.jpg',
        img2: 'assets/images/grass2.jpg',
        img3: 'assets/images/grass3.jpg'),
    Task(
        title: 'Need to fix my bike',
        location: 'Horsens, 8700',
        price: '200 DKK',
        duration: '1 hour',
        dueDate: '27/09/2021',
        img1: 'assets/images/bike4.jpg',
        img2: 'assets/images/bike5.jpg',
        img3: 'assets/images/bike6.jpg'),
    Task(
        title: 'IKEA closet assembly',
        location: 'Aarhus, 8800',
        price: '280 DKK',
        duration: '7 hour',
        dueDate: '26/09/2021',
        img1: 'assets/images/closet4.jpg',
        img2: 'assets/images/closet5.jpg',
        img3: 'assets/images/closet6.jpg'),
    Task(
        title: 'Mow lawn and trim hedges',
        location: 'Vejen, 6600',
        price: '310 DKK',
        duration: '9 hour',
        dueDate: '21/09/2021',
        img1: 'assets/images/grass1.jpg',
        img2: 'assets/images/grass2.jpg',
        img3: 'assets/images/grass3.jpg'),
    Task(
        title: 'Mow lawn and trim hedges',
        location: 'Vejen, 6600',
        price: '310 DKK',
        duration: '9 hour',
        dueDate: '21/09/2021',
        img1: 'assets/images/grass1.jpg',
        img2: 'assets/images/grass2.jpg',
        img3: 'assets/images/grass3.jpg'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Do a bubble bath for me', location: 'Vejle, 8700',price: '150 DKK', duration: '1 hours', dueDate: '30/09/2021'),
  ];

  // var services = <Service>[
  //   Service(title: 'Fix my phone', location: 'Horsens, 8700', price: '350 DKK',
  //       duration: '2 hours', dueDate: '30/11/2021', category: 'Repairs', timeSincePosted: '3 h',
  //       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
  //       image: 'assets/images/phone_repair.jpg', numberOfBids: 5),
  //
  //   Service(title: 'Mow the lawn', location: 'Horsens, 8700', price: '200 DKK',
  //       duration: '3 hours', dueDate: '30/11/2021', category: 'Gardening', timeSincePosted: '1 d',
  //       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
  //       image: 'assets/images/grass2.jpg', numberOfBids: 12),
  //
  //   Service(title: 'Bike repair', location: 'Horsens, 8700', price: '750 DKK',
  //       duration: '5 hours', dueDate: '2/12/2021', category: 'Repairs', timeSincePosted: '10 h',
  //       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
  //       image: 'assets/images/bike6.jpg', numberOfBids: 256),
  //
  //   Service(title: 'Mow the lawn', location: 'Horsens, 8700', price: '200 DKK',
  //       duration: '3 hours', dueDate: '30/11/2021', category: 'Gardening', timeSincePosted: '1 d',
  //       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
  //       image: 'assets/images/grass2.jpg', numberOfBids: 12),
  //
  //   Service(title: 'Bike repair', location: 'Horsens, 8700', price: '750 DKK',
  //       duration: '5 hours', dueDate: '2/12/2021', category: 'Repairs', timeSincePosted: '10 h',
  //       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
  //       image: 'assets/images/bike6.jpg', numberOfBids: 256),
  //
  // ];

  var trendingServices = <OldService>[
    OldService(
        title: 'Hiking instructor',
        location: 'Everest, 8800',
        price: '3500 DKK',
        duration: '2 hours',
        dueDate: '30/11/2021',
        category: 'Repairs',
        timeSincePosted: '3 h',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain1.jpg',
        numberOfBids: 5),
    OldService(
        title: 'Glacier expert needed',
        location: 'Antartica, 5508',
        price: '900 DKK',
        duration: '2 hours',
        dueDate: '30/11/2021',
        category: 'Repairs',
        timeSincePosted: '3 h',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain2.jpg',
        numberOfBids: 5),
    OldService(
        title: 'Hiking instructor',
        location: 'Everest, 8800',
        price: '3500 DKK',
        duration: '2 hours',
        dueDate: '30/11/2021',
        category: 'Repairs',
        timeSincePosted: '3 h',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain1.jpg',
        numberOfBids: 5),
    OldService(
        title: 'Hiking instructor',
        location: 'Everest, 8800',
        price: '3500 DKK',
        duration: '2 hours',
        dueDate: '30/11/2021',
        category: 'Repairs',
        timeSincePosted: '3 h',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain1.jpg',
        numberOfBids: 5),
  ];

  var categories = <Category>[
    Category('Food', 'assets/category_icons/grocery.png'),
    Category('Physics', 'assets/category_icons/rocket.png'),
    Category('Gardening', 'assets/category_icons/gardening.png'),
    Category('Cooking', 'assets/category_icons/cooking.png'),
    Category('Cleaning', 'assets/category_icons/basket.png'),
    Category('Pets', 'assets/category_icons/shiba.png'),
    Category('Pest control', 'assets/category_icons/spider.png'),
  ];

  List<OldProduct> products = [
    OldProduct('IKEA closet', '1500 kr.', 'Copenhagen, 1500',
        'assets/images/closet5.jpg'),
    OldProduct('Original Porsche Macan', '110000 kr.', 'Horsens, 8700',
        'assets/images/porsche.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('House for sale', '60000 kr.', 'Lunderskov, 3030',
        'assets/images/grass2.jpg'),
    OldProduct('Bicycle', '250 kr.', 'Horsens, 8700', 'assets/images/bike5.jpg'),
    OldProduct('Lian li pc', '10500 kr.', 'Kolding, 6800',
        'assets/images/lian-li-pc.jpg'),
    OldProduct(
        'Rustic cabinet', '65 kr.', 'Vejen, 6600', 'assets/images/cabinet.jpg'),
    OldProduct('Nike Dunk Low Black/White', '1499 kr.', 'Horsens, 8700',
        'assets/images/nike.jpg'),
    OldProduct('Study table with adjustable height', '600 kr.', 'Silkeborg, 9800',
        'assets/images/table.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    OldProduct('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

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
                          'Browse',
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
                        Tab(text: 'Trending'),
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
                      // BrowseServices(trendingServices, products, categories);
                      FutureBuilder(
                          future: Future.wait([
                            serviceViewModel.getAllServices(),
                            productViewModel.getAllProducts(),
                            categoryViewModel.getAllServiceCategories()
                          ]),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (serviceViewModel.services.length == 0) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                  //Text('No bookings exist'),
                                ),
                              );
                            } else {
                              return BrowseServices(trendingServices, productViewModel.productsAll, categories);
                            }
                          }),

                      FutureBuilder(
                          future: Future.wait([
                            serviceViewModel.getLatestServices(),
                            categoryViewModel.getAllServiceCategories()
                          ]),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (serviceViewModel.services.length == 0) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                  //Text('No bookings exist'),
                                ),
                              );
                            } else {
                              return ServicesCard(serviceViewModel.services, categoryViewModel.serviceCategories);
                            }
                          }),

                      FutureBuilder(
                          future: Future.wait([
                            productViewModel.getLatestProducts(),
                            categoryViewModel.getAllProductCategories()
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
                              return ProductCard(productViewModel.products, categoryViewModel.productCategories);
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
