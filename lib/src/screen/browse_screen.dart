import 'package:flutter/material.dart';
import 'package:flutter_master_template/src/widgets/browse_screen_widgets.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {

  Widget searchbar = Text("Browse Categories");
  Icon searchicon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchbar,
        centerTitle: true,
        backgroundColor: Color(0xFF002da5),
        actions: [
          IconButton(
            icon: searchicon, 
            onPressed: (){
              setState(() {
                if(this.searchicon.icon == Icons.search)
                {
                  this.searchicon= Icon(Icons.cancel);
                  this.searchbar = Container(
                    width: 250.0,
                    height: 40.0,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                        contentPadding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 20.0,right: 5.0),
                        hintText: 'search here',
                        hintStyle: TextStyle(color: Colors.white54)
                      ),
                    ),
                  );
                }
                else{
                  this.searchbar = Text("Browse Categories");
                  this.searchicon = Icon(Icons.search);
                }
              });
            },
          ),
        ],
      ),

      body: Browse(),
      
    );
  }
}