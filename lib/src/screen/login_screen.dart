import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master_template/route_generator.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();

void validate(){
  if (formkey.currentState.validate()){
    print("Ok");
  } else{
    print("error");
  }
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // agar user logged in hay toh dashboard se send krne k leye code
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      resizeToAvoidBottomPadding: false, 

      body:Column(
        children: <Widget>[
          Expanded(
            flex:3,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  "assets/Nearbybg.jpg",
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset("assets/nearby_logo.png")
                    ],
                  )
                )
              ],
            )
          ),


          Expanded(
            flex:7,
            child: Column(
              children: <Widget>[
                SizedBox(height: 25),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),

                Column(
                    children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal:25.0),
                       child: Container(
                         child: Center(
                           child: Form(
                             autovalidate: true,
                              key: formkey,
                             child: Column(
                               children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(),
                                      decoration: InputDecoration(
                                        labelText: "Your email address",
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(errorText: "Required"),
                                        EmailValidator(errorText: "Please Enter Valid Email"),
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Your password",
                                        prefixIcon: Icon(Icons.vpn_key),
                                      ),
                                      validator: (val){
                                        if (val.isEmpty){
                                          return "Required";
                                        }
                                        else if(val.length < 6){
                                          return "At least 6 characters password required";
                                        }
                                        else{
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     )
                    ]
                ),


                Padding(
                  padding: const EdgeInsets.only(left:15,right:15,bottom:15,top:20),
                  child: OutlineButton(
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, dashboardRoute, (route) => false);
                    },
                    borderSide: BorderSide(width: 2.0,color:Colors.blue[600]),
                    padding: EdgeInsets.symmetric(vertical: 13.0,horizontal: 150.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    textColor: Colors.blue,
                    splashColor: Colors.black45,
                    child: Text("Login"),
                  ),
                ),

                DecoratedBox(
                      decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),color: Colors.blue[900]),
                      child: OutlineButton(
                        onPressed: (){},
                        padding: EdgeInsets.symmetric(horizontal: 103.0,vertical: 13.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        child: Text("Login with Facebook",style: TextStyle(color: Colors.white),)
                        ),
                      ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    onPressed: (){},
                    textColor: Colors.black54,
                    child: Text(
                      "Forget Password?",
                    ),
                  ),
                ),

              ],
            )
          ),
        ],
      )      
    );
  }
}	