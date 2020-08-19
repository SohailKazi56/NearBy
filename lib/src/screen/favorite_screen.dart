import 'package:flutter/material.dart';
import 'package:flutter_master_template/src/widgets/RestaurantUI.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  Widget searchBar = Text("Favorites",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),);
  Icon searchIcon = Icon(Icons.search);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF002da5),
        title: searchBar,
        actions: [
          IconButton(
            icon: searchIcon,
            onPressed: (){
             setState(() {
               if(this.searchIcon.icon == Icons.search){
                 this.searchIcon = Icon(Icons.cancel);
                 this.searchBar = Container(
                   width: 250,
                   height: 40,
                   child: TextField(
                     style: TextStyle(
                       fontSize: 20.0,
                       color: Colors.white
                     ),
                     decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                       contentPadding: EdgeInsets.only(top:3.0,left: 20,right: 3.0,bottom: 3.0),
                       hintText: "search restaurants",
                       hintStyle: TextStyle(color: Colors.white54)
                     ),
                   ),

                 );
               }else{
                 this.searchIcon = Icon(Icons.search);
                 this.searchBar = Text("Favorites",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),);
               }
             });
           },
          )
        ],
      ),

      body: RestaurantUI(),
      );
  }
}