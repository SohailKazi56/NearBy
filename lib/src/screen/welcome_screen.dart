import 'package:flutter/material.dart';
import '../../route_generator.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override

  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.of(context)
    //       .pushNamedAndRemoveUntil(loginRoute, (Route<dynamic> route) => false);
    // });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/Nearbybg.jpg',
            fit: BoxFit.fitWidth,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset("assets/nearby_logo.png",width: 200,height: 100,),
                     ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Discover nearby interesting places to visit \n and enjoy life",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                  ],
                )
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 50.0)),
                    // MaterialButton(
                    //            onPressed: (){Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);},
                    //            minWidth:300.0,
                    //            textColor: Colors.blue[900],
                    //            color: Colors.white,
                    //            splashColor: Colors.black12,
                    //            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    //            padding:EdgeInsets.symmetric(
                    //              vertical : 12.0,
                    //            ),
                    //            child: Text(
                    //              "Login",
                    //              style: TextStyle(
                    //                fontSize: 15.0,
                    //                fontWeight: FontWeight.w600,
                    //              ),
                    //            ),
                    //          ),

                    DecoratedBox(
                      decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),color: Colors.white),
                      child: OutlineButton(
                        onPressed: (){Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);},
                        padding: EdgeInsets.symmetric(horizontal: 130.0,vertical: 13.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        child: Text("Login",style: TextStyle(color: Colors.blue[900],fontSize: 20 )),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OutlineButton(
                        onPressed: (){
                          Navigator.pushNamed(context, registerRoute);
                        },
                        borderSide: BorderSide(width: 2.0,color: Colors.white),
                        padding: EdgeInsets.symmetric(horizontal: 120.0,vertical: 13.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                      )
                    ),
                    
                  ],
                ),
              )
            ],
          )
          
        ],
      ),
    );
  }
}