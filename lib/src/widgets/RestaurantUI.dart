import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_master_template/src/screen/map_screen.dart';

class RestaurantUI extends StatefulWidget {
  @override
  _RestaurantUIState createState() => _RestaurantUIState();
}

class _RestaurantUIState extends State<RestaurantUI> {

  Future<List<Restaurant>> _getRestaurants() async {
    var data  = await DefaultAssetBundle.of(context).loadString("assets/restaurants_data.json");
    var jsonData = json.decode(data.toString());

    List<Restaurant> restaurants = [];
    for(var u in jsonData){
      Restaurant restaurant = Restaurant(u["index"], u["name"], u["location"], u["picture"], u["likes"],u["time"],u["description"],u["contact"],u["email"]);

      restaurants.add(restaurant);
    }
    print(restaurants.length);
    return restaurants;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: FutureBuilder(
          future: _getRestaurants(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(child: Center(child: Text("Loading..."),),);
            }else{
              return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(snapshot.data[index].picture),),
                  title: Text(snapshot.data[index].name,style: TextStyle(fontSize: 20.0),),
                  subtitle: Container(
                    child: Row(
                    children: [
                      Text(snapshot.data[index].location),
                      Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(Icons.favorite,size: 15.0,color: Colors.grey,),
                          Text(snapshot.data[index].likes),
                        ],
                      ),
                  )])),
                  trailing: Icon(Icons.keyboard_arrow_right),
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index])));
                   },
                );
              },
            );
            } 
          },
        ),
      ),
    );
  }
}

class Restaurant{
  final String index;
  final String name;
  final String location;
  final String picture;
  final String likes;
  final String time;
  final String description;
  final String contact;
  final String email;

  Restaurant(this.index,this.name,this.location,this.picture,this.likes,this.time,this.description,this.contact,this.email);
}

class DetailPage extends StatelessWidget {

  Widget mapSampleLocation(){
    return(
      MapSample()
    );
  }

  final Restaurant restaurant;
  DetailPage(this.restaurant);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002da5),
        title: Text(restaurant.location),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Icon(Icons.favorite,color: Colors.white),
        )],),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset("assets/restaurant_img.jpg",fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.black54,),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(restaurant.name,style: TextStyle(fontSize: 30,color: Colors.white),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,color: Colors.white,size: 15,),
                                      Text(restaurant.location,style: TextStyle(fontSize: 15,color: Colors.white),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:24.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.watch_later,color: Colors.white,size: 15,),
                                        Text(restaurant.time,style: TextStyle(fontSize: 15,color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.favorite,color: Colors.white,size: 15,),
                                        Text(restaurant.likes,style: TextStyle(fontSize: 15,color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))                        
                  ],
                )
                
              ],
            ),
          ),
          
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(restaurant.description),
              ),
            )
          ),

          Expanded(
            flex:1,
            child: Container(
              alignment: Alignment.center,
              color: Color(0xFF1455d8),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_in_talk,color:Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(left:2.0),
                      child: Text(restaurant.contact,style:TextStyle(fontSize: 17,color:Colors.white)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(Icons.email,color:Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(left:2.0),
                        child: Text(restaurant.email,style:TextStyle(fontSize: 17,color:Colors.white)),
                      ),
                    ],
                  ),
                )
              ],
              ),
            )
          ),

          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //MapScreen()
                //Image.asset("assets/restaurant_img.jpg",fit: BoxFit.cover),
                mapSampleLocation(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

