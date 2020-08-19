import 'package:flutter/material.dart';

import '../../route_generator.dart';

class ProfileUI extends StatefulWidget {
  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Image.asset("assets/profilebg.jpg",fit: BoxFit.cover,),
              Positioned(bottom: -50, child: CircleAvatar(radius: 60,backgroundColor: Colors.white, backgroundImage: AssetImage("assets/profilePicture.jpg"), )),
            ],
          ),
           SizedBox(height: 45),
          FlatButton(
            onPressed: (){},
            child: Text(
              "change photo",
              style: TextStyle(color: Color(0xFF1455d8),fontWeight: FontWeight.w500),
            )
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15,left: 50,right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                        labelText: "Sohail_Kazi",
                        labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      enabled: false,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        labelText: "sohailmk24@gmail.com",
                        labelStyle: TextStyle(fontSize: 18.0),
                        prefixIcon: Icon(Icons.mail_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      enabled: false,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        labelText: "***********",
                        labelStyle: TextStyle(fontSize: 18.0),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, loginRoute);
                      },
                      minWidth: 320,
                      color: Colors.redAccent,
                      splashColor: Colors.red,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
                    ),
                  )
                ],
              ),
            ),
          ),
         ],
      ),
    );
  }
}