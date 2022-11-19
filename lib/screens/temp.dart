import 'package:advella/cards/product_card.dart';
import 'package:advella/cards/service_card.dart';
import 'package:advella/models/category.dart';
import 'package:advella/models/product.dart';
import 'package:advella/models/service.dart';
import 'package:advella/models/task.dart';
import 'package:flutter/material.dart';

import 'browse_services.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> with TickerProviderStateMixin{

  int? _value = 1;

  List<Task> tasks = [
    Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021', img1: 'assets/images/bike4.jpg', img2: 'assets/images/bike5.jpg', img3: 'assets/images/bike6.jpg'),
    Task(title: 'IKEA closet assembly', location: 'Aarhus, 8800',price: '280 DKK', duration: '7 hour', dueDate: '26/09/2021', img1: 'assets/images/closet4.jpg', img2: 'assets/images/closet5.jpg', img3: 'assets/images/closet6.jpg'),
    Task(title: 'Mow lawn and trim hedges', location: 'Vejen, 6600',price: '310 DKK', duration: '9 hour', dueDate: '21/09/2021', img1: 'assets/images/grass1.jpg', img2: 'assets/images/grass2.jpg', img3: 'assets/images/grass3.jpg'),
    Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021', img1: 'assets/images/bike4.jpg', img2: 'assets/images/bike5.jpg', img3: 'assets/images/bike6.jpg'),
    Task(title: 'IKEA closet assembly', location: 'Aarhus, 8800',price: '280 DKK', duration: '7 hour', dueDate: '26/09/2021', img1: 'assets/images/closet4.jpg', img2: 'assets/images/closet5.jpg', img3: 'assets/images/closet6.jpg'),
    Task(title: 'Mow lawn and trim hedges', location: 'Vejen, 6600',price: '310 DKK', duration: '9 hour', dueDate: '21/09/2021', img1: 'assets/images/grass1.jpg', img2: 'assets/images/grass2.jpg', img3: 'assets/images/grass3.jpg'),
    Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021', img1: 'assets/images/bike4.jpg', img2: 'assets/images/bike5.jpg', img3: 'assets/images/bike6.jpg'),
    Task(title: 'IKEA closet assembly', location: 'Aarhus, 8800',price: '280 DKK', duration: '7 hour', dueDate: '26/09/2021', img1: 'assets/images/closet4.jpg', img2: 'assets/images/closet5.jpg', img3: 'assets/images/closet6.jpg'),
    Task(title: 'Mow lawn and trim hedges', location: 'Vejen, 6600',price: '310 DKK', duration: '9 hour', dueDate: '21/09/2021', img1: 'assets/images/grass1.jpg', img2: 'assets/images/grass2.jpg', img3: 'assets/images/grass3.jpg'),
    Task(title: 'Mow lawn and trim hedges', location: 'Vejen, 6600',price: '310 DKK', duration: '9 hour', dueDate: '21/09/2021', img1: 'assets/images/grass1.jpg', img2: 'assets/images/grass2.jpg', img3: 'assets/images/grass3.jpg'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Need to fix my bike', location: 'Horsens, 8700',price: '200 DKK', duration: '1 hour', dueDate: '27/09/2021'),
    // Task(title: 'Do a bubble bath for me', location: 'Vejle, 8700',price: '150 DKK', duration: '1 hours', dueDate: '30/09/2021'),
  ];

  var services = <Service>[
    Service(title: 'Fix my phone', location: 'Horsens, 8700', price: '350 DKK',
        duration: '2 hours', dueDate: '30/11/2021', category: 'Repairs', timeSincePosted: '3 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/phone_repair.jpg', numberOfBids: 5),

    Service(title: 'Mow the lawn', location: 'Horsens, 8700', price: '200 DKK',
        duration: '3 hours', dueDate: '30/11/2021', category: 'Gardening', timeSincePosted: '1 d',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
        image: 'assets/images/grass2.jpg', numberOfBids: 12),

    Service(title: 'Bike repair', location: 'Horsens, 8700', price: '750 DKK',
        duration: '5 hours', dueDate: '2/12/2021', category: 'Repairs', timeSincePosted: '10 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
        image: 'assets/images/bike6.jpg', numberOfBids: 256),

    Service(title: 'Mow the lawn', location: 'Horsens, 8700', price: '200 DKK',
        duration: '3 hours', dueDate: '30/11/2021', category: 'Gardening', timeSincePosted: '1 d',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
        image: 'assets/images/grass2.jpg', numberOfBids: 12),

    Service(title: 'Bike repair', location: 'Horsens, 8700', price: '750 DKK',
        duration: '5 hours', dueDate: '2/12/2021', category: 'Repairs', timeSincePosted: '10 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod. Nulla facilisi. Praesent quis augue dignissim, porta enim eu, pulvinar urna. Morbi in sapien erat. Pellentesque id nulla vel lacus tincidunt lacinia. Aliquam convallis erat at ultricies interdum. Maecenas risus tellus, posuere vitae nisl eget, interdum lobortis est. ',
        image: 'assets/images/bike6.jpg', numberOfBids: 256),

  ];

  var trendingServices = <Service>[
    Service(title: 'Hiking instructor', location: 'Everest, 8800', price: '3500 DKK',
        duration: '2 hours', dueDate: '30/11/2021', category: 'Repairs', timeSincePosted: '3 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain1.jpg', numberOfBids: 5),
    Service(title: 'Glacier expert needed', location: 'Antartica, 5508', price: '900 DKK',
        duration: '2 hours', dueDate: '30/11/2021', category: 'Repairs', timeSincePosted: '3 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain2.jpg', numberOfBids: 5),
    Service(title: 'Hiking instructor', location: 'Everest, 8800', price: '3500 DKK',
        duration: '2 hours', dueDate: '30/11/2021', category: 'Repairs', timeSincePosted: '3 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain1.jpg', numberOfBids: 5),
    Service(title: 'Hiking instructor', location: 'Everest, 8800', price: '3500 DKK',
        duration: '2 hours', dueDate: '30/11/2021', category: 'Repairs', timeSincePosted: '3 h',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tincidunt metus nec consequat euismod.',
        image: 'assets/images/mountain1.jpg', numberOfBids: 5),
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

  List<Product> products = [
    Product('IKEA closet', '1500 kr.', 'Copenhagen, 1500', 'assets/images/closet5.jpg'),
    Product('Original Porsche Macan', '110000 kr.', 'Horsens, 8700', 'assets/images/porsche.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('House for sale', '60000 kr.', 'Lunderskov, 3030', 'assets/images/grass2.jpg'),
    Product('Bicycle', '250 kr.', 'Horsens, 8700', 'assets/images/bike5.jpg'),
    Product('Lian li pc', '10500 kr.', 'Kolding, 6800', 'assets/images/lian-li-pc.jpg'),
    Product('Rustic cabinet', '65 kr.', 'Vejen, 6600', 'assets/images/cabinet.jpg'),
    Product('Nike Dunk Low Black/White', '1499 kr.', 'Horsens, 8700', 'assets/images/nike.jpg'),
    Product('Study table with adjustable height', '600 kr.', 'Silkeborg, 9800', 'assets/images/table.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg'),
    Product('Iphone 6', '600 kr.', 'Vejen, 6600', 'assets/images/iphone6.jpg')
  ];


  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: false,
              expandedHeight: 150,
              backgroundColor: Colors.transparent,
              flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 20),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.menu, size: 30,color: Colors.black54,),
                          new Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/profile_pic.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18,),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Browse',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
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
                          indicator: CircleTabIndicator(color: Colors.blueAccent, radius: 4),
                          tabs: [
                            Tab(text: 'Home'),
                            Tab(text: 'Services'),
                            Tab(text: 'Products'),
                            Tab(text: 'Events'),
                          ],
                        ),
                      ),
                    ),
                  ]
              ),

            ),

            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          BrowseServices(trendingServices, categories, services),
                          ServicesCard(services),
                          ProductCard(products),
                          Text('Bye'),
                        ],
                      ),
                    ),
                  ),
                  /////////////////////////////////// Expanded(child: PostCard(posts)),
                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class CircleTabIndicator extends Decoration
{
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter
{
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height -10);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}

// return SafeArea(
//   child: Scaffold(
//     backgroundColor: Colors.white,
//     body: Container(
//       // decoration: BoxDecoration(
//       //   image: DecorationImage(
//       //     image: AssetImage("assets/images/backWall.jpg"),
//       //     fit: BoxFit.cover,
//       //   ),
//       // ),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
//             child: TextField(
//               textAlignVertical: TextAlignVertical.center,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 hintText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton(
//                     value: _value,
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                     items: [
//                       DropdownMenuItem(
//                         child: Text("Latest"),
//                         value: 1,
//                       ),
//                       DropdownMenuItem(
//                         child: Text("Oldest"),
//                         value: 2,
//                       ),
//                     ],
//                     onChanged: (int? value) {
//                       setState(() {
//                         _value = value;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               new Spacer(),
//               IconButton(
//                 onPressed: () => Navigator.of(context).pushNamed('/filter'),
//                 icon: Icon(Icons.filter_alt_outlined),
//                 color: Colors.grey,
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, "/browseMap");
//                 },
//                 icon: Icon(Icons.location_on_outlined),
//                 color: Colors.grey,
//               ),
//             ],
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
//   ),
// );


//////////////////////////////////////////////////
/*
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    ),
                  ),
              ),

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_alt),
                color: Colors.blue,
                  ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.location_on_outlined),
                color: Colors.blue,
                  ),
            ],
          ),
        ),
      ),
      body: Column(
        children: tasks.map((task) => TaskCard(
          task: task,
        )).toList(),
      ),
    );
    */
///////////////////////////////////////////////////////////////////////



// child: Column(
//   children: <Widget>[
//     Center(
//     child: TextField(
//       textAlignVertical: TextAlignVertical.bottom,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         hintText: 'Search',
//         prefixIcon: Icon(Icons.search),
//         ),
//       ),
//     ),
//     Text('Latest'),
//   ],
// ),



// body: Column(
//     children: [
//       Text('data'),
//       ListView.builder(
//         itemCount: tasks.length,
//         itemBuilder: (itemBuilder, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
//             child: Card(
//               margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
//               child: Card(
//                 child: ListTile(
//                   onTap: () {},
//                   title: Text(tasks[index].title),
//                 ),
//               ),
//             ),
//           );
//
//         },
//       )
//     ],
// ),
//   body: ListView.builder(
//       itemCount: tasks.length,
//       itemBuilder: (itemBuilder, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
//           child: Card(
//             margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Text(
//                   task.title,
//                 ),
//                 Text(
//                   task.location,
//                 ),
//                 Text(
//                   task.price,
//                 ),
//                 Text(
//                   task.duration,
//                 ),
//                 Text(
//                   task.dueDate,
//                 ),
//               ],
//             ),
//           ),
//         );
//
//       },
// )

// body: Column(
//   children: tasks.map((task) => TaskCard(
//     task: task,
//   )).toList(),
// ),
