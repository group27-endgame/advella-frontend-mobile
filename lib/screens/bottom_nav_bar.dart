import 'package:advella/screens/products_screen.dart';
import 'package:findhelpie_flutter_app/Auth/login_screen.dart';
import 'package:findhelpie_flutter_app/screens/products_screen.dart';
import 'package:flutter/material.dart';

import 'browse_screen.dart';
import 'my_tasks_screen.dart';

class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  List screens = [
    BrowseScreen(),
    ProductsScreen(),
    MyTasksScreen(),
    // PostTaskScreen(),
    // InboxScreen(),
    LoginScreen(),
  ];

  void onTap(int index)
  {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              title: Text('Browse'),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text('My Items'),
              icon: Icon(Icons.bar_chart_sharp)
          ),
          BottomNavigationBarItem(
              title: Text('Chat'),
              icon: Icon(Icons.chat)
          ),
          BottomNavigationBarItem(
              title: Text('Account'),
              icon: Icon(Icons.person)
          ),
        ],
        // index: index,
        // onTap: (index) => setState(() {
        //   this.index = index;
        // }),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: screens[index],
    //   bottomNavigationBar: CurvedNavigationBar(
    //       color: Colors.blue,
    //       backgroundColor: Colors.transparent,
    //       items: [
    //         SvgPicture.asset(
    //           "assets/icons/home.svg",
    //           color: index == 0 ? Colors.white : Colors.white60,
    //         ),
    //         Icon(
    //           Icons.catching_pokemon_outlined,
    //           size: 30,
    //           color: index == 1 ? Colors.white : Colors.white60,
    //         ),
    //         SvgPicture.asset(
    //           "assets/icons/tasks.svg",
    //           color: index == 1 ? Colors.white : Colors.white60,
    //         ),
    //         SvgPicture.asset(
    //           "assets/icons/add.svg",
    //           color: index == 2 ? Colors.white : Colors.white60,
    //         ),
    //         Badge(
    //           badgeContent: Text("21", style: TextStyle(color: Colors.white),),
    //           child: SvgPicture.asset(
    //             "assets/icons/inbox.svg",
    //             color: index == 3 ? Colors.white : Colors.white60,
    //           ),
    //         ),
    //         SvgPicture.asset(
    //           "assets/icons/account.svg",
    //           color: index == 4 ? Colors.white : Colors.white60,
    //         ),
    //       ],
    //       height: 60,
    //       animationCurve: Curves.easeInOut,
    //       animationDuration: Duration(milliseconds: 300),
    //       index: index,
    //       onTap: (index) => setState(() {
    //         this.index = index;
    //       }),
    //     ),
    // );
  }
}
