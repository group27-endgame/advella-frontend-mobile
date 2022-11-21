import 'package:advella/Auth/login_screen.dart';
import 'package:advella/screens/bottom_nav_bar.dart';
import 'package:advella/screens/browse_screen_map.dart';
import 'package:advella/screens/filter_screen.dart';
import 'package:advella/screens/post_task_detail_screen.dart';
import 'package:advella/screens/subcategory_screens/cleaning_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/delivery_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/driver_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/furniture_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/gardening_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/grocery_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/laundry_subcategory_screen.dart';
import 'package:advella/screens/subcategory_screens/pet_sitter_subcategory_screen.dart';
import 'package:advella/screens/task_detail_screen.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:advella/viewmodels/category_viewmodel.dart';
import 'package:advella/viewmodels/service_viewmodel.dart';
import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'Auth/register_screen.dart';

final _authStorage = UserLocalStorageService();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        // ChangeNotifierProvider(create: (_) => VisitViewModel()),
        // ChangeNotifierProvider(create: (_) => DeviationViewModel()),
      ],
      child: MaterialApp(
        // localizationsDelegates: AppLocalizations.localizationsDelegates, // <- here
        // supportedLocales: AppLocalizations.supportedLocales, // <- and here
        // localizationsDelegates: AppLocalizations.localizationsDelegates, // <- here
        // supportedLocales: AppLocalizations.supportedLocales, // <- and here
        navigatorKey: navigatorKey,
        title: 'Advella',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          // elevatedButtonTheme: ElevatedButtonThemeData(
          //     style: TextButton.styleFrom(backgroundColor: primaryColorButton)
          // ),
          // inputDecorationTheme: InputDecorationTheme(
          //     border: textFieldBorder,
          //     enabledBorder: textFieldBorder,
          //     focusedBorder: textFieldBorder
          // ),
        ),
        themeMode: ThemeMode.light,
        home: LoginScreen(),
        routes: {
          '/taskDetail': (BuildContext context) => new TaskDetailScreen(),
          '/browseMap': (BuildContext context) => new BrowseMap(),
          '/gardeningSubcategory': (BuildContext context) => new GardeningSubcategoryScreen(),
          '/deliverySubcategory': (BuildContext context) => new DeliverySubcategoryScreen(),
          '/petSitterSubcategory': (BuildContext context) => new PetSitterSubcategoryScreen(),
          '/cleaningSubcategory': (BuildContext context) => new CleaningSubcategoryScreen(),
          '/grocerySubcategory': (BuildContext context) => new GrocerySubcategoryScreen(),
          '/furnitureSubcategory': (BuildContext context) => new FurnitureSubcategoryScreen(),
          '/driverSubcategory': (BuildContext context) => new DriverSubcategoryScreen(),
          '/laundrySubcategory': (BuildContext context) => new LaundrySubcategoryScreen(),
          '/postTaskDetail': (BuildContext context) => new PostTaskDetailScreen(),
          '/filter': (BuildContext context) => new FilterScreen(),
          '/register': (BuildContext context) => new RegisterScreen(),
          '/login': (BuildContext context) => new LoginScreen(),
        },
      ),
    );
  }
}








// void main() {
//   runApp(MaterialApp(
//     // theme: ThemeData(
//     //     textTheme: GoogleFonts.solwayTextTheme(
//     //       Theme.of().textTheme,
//     //     ),
//     // ),
//     debugShowCheckedModeBanner: false,
//     routes: {
//       '/taskDetail': (BuildContext context) => new TaskDetailScreen(),
//       '/browseMap': (BuildContext context) => new BrowseMap(),
//       '/gardeningSubcategory': (BuildContext context) => new GardeningSubcategoryScreen(),
//       '/deliverySubcategory': (BuildContext context) => new DeliverySubcategoryScreen(),
//       '/petSitterSubcategory': (BuildContext context) => new PetSitterSubcategoryScreen(),
//       '/cleaningSubcategory': (BuildContext context) => new CleaningSubcategoryScreen(),
//       '/grocerySubcategory': (BuildContext context) => new GrocerySubcategoryScreen(),
//       '/furnitureSubcategory': (BuildContext context) => new FurnitureSubcategoryScreen(),
//       '/driverSubcategory': (BuildContext context) => new DriverSubcategoryScreen(),
//       '/laundrySubcategory': (BuildContext context) => new LaundrySubcategoryScreen(),
//       '/postTaskDetail': (BuildContext context) => new PostTaskDetailScreen(),
//       '/filter': (BuildContext context) => new FilterScreen(),
//       '/register': (BuildContext context) => new RegisterScreen(),
//       '/login': (BuildContext context) => new LoginScreen(),
//     },
//     home: LoginScreen(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   int currentIndex = 0;
//
//   List screens = [
//     BrowseScreen(),
//     ProductsScreen(),
//     MyTasksScreen(),
//     // PostTaskScreen(),
//     // InboxScreen(),
//     LoginScreen(),
//   ];
//
//   void onTap(int index)
//   {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         // color: Colors.blue,
//         // backgroundColor: Colors.transparent,
//         onTap: onTap,
//         currentIndex: 0,
//         selectedItemColor: Colors.black54,
//         unselectedItemColor: Colors.grey.withOpacity(0.5),
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         elevation: 0,
//         items: [
//           BottomNavigationBarItem(
//             title: Text('Browse'),
//             icon: Icon(Icons.home)
//           ),
//           BottomNavigationBarItem(
//             title: Text('My Items'),
//             icon: Icon(Icons.bar_chart_sharp)
//           ),
//           BottomNavigationBarItem(
//             title: Text('Chat'),
//             icon: Icon(Icons.chat)
//           ),
//           BottomNavigationBarItem(
//             title: Text('Account'),
//             icon: Icon(Icons.person)
//           ),
//         ],
//       ),
//     );
//
//     // return Scaffold(
//     //   backgroundColor: Colors.white,
//     //   body: screens[index],
//     //   bottomNavigationBar: CurvedNavigationBar(
//     //       color: Colors.blue,
//     //       backgroundColor: Colors.transparent,
//     //       items: [
//     //         SvgPicture.asset(
//     //           "assets/icons/home.svg",
//     //           color: index == 0 ? Colors.white : Colors.white60,
//     //         ),
//     //         Icon(
//     //           Icons.catching_pokemon_outlined,
//     //           size: 30,
//     //           color: index == 1 ? Colors.white : Colors.white60,
//     //         ),
//     //         SvgPicture.asset(
//     //           "assets/icons/tasks.svg",
//     //           color: index == 1 ? Colors.white : Colors.white60,
//     //         ),
//     //         SvgPicture.asset(
//     //           "assets/icons/add.svg",
//     //           color: index == 2 ? Colors.white : Colors.white60,
//     //         ),
//     //         Badge(
//     //           badgeContent: Text("21", style: TextStyle(color: Colors.white),),
//     //           child: SvgPicture.asset(
//     //             "assets/icons/inbox.svg",
//     //             color: index == 3 ? Colors.white : Colors.white60,
//     //           ),
//     //         ),
//     //         SvgPicture.asset(
//     //           "assets/icons/account.svg",
//     //           color: index == 4 ? Colors.white : Colors.white60,
//     //         ),
//     //       ],
//     //       height: 60,
//     //       animationCurve: Curves.easeInOut,
//     //       animationDuration: Duration(milliseconds: 300),
//     //       index: index,
//     //       onTap: (index) => setState(() {
//     //         this.index = index;
//     //       }),
//     //     ),
//     // );
//   }
// }