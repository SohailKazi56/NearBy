import 'package:flutter/material.dart';
import 'package:flutter_master_template/src/screen/browse_screen.dart';
import 'package:flutter_master_template/src/screen/profile_screen.dart';

import 'favorite_screen.dart';
import 'location_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override

  
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _currentIndex = 1;
  final tabs = [
    //Center(child: Text('Location Tab',style: TextStyle(color: Colors.red),)),
    LocationScreen(),
    BrowseScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedFontSize: 15,
        selectedItemColor: Colors.blue[900],
        items: [
         BottomNavigationBarItem(
           icon:  Icon(Icons.location_on),
           title:  Text('Location'),  
         ),

         BottomNavigationBarItem(
           icon:  Icon(Icons.menu),
           title:  Text('Browse'),  
         ),

         BottomNavigationBarItem(
           icon:  Icon(Icons.favorite),
           title:  Text('Favorite'),
         ),

         BottomNavigationBarItem(
           icon:  Icon(Icons.person),
           title:  Text('Profile'),
         ),   
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        }
      ), 
    );
  }
}