import 'package:flutter/material.dart';
import 'package:flutter_master_template/route_generator.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();

void validate(){
  if (formkey.currentState.validate()){
    print("Ok");
  } else{
    print("error");
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "Register Here",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600
            ),
          ),
          
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40,vertical: 10),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                  autovalidate: true,
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                          labelText: "First Name",
                          prefixIcon: Icon(Icons.person)
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          prefixIcon: Icon(Icons.person)
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                          labelText: "Enter your Email ",
                          prefixIcon: Icon(Icons.email)
                        ),
                        validator: MultiValidator([
                                      RequiredValidator(errorText: "Required"),
                                      EmailValidator(errorText: "Please Enter Valid Email"),
                                    ]),
                      ),
                      TextFormField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                          labelText: "Create password",
                          prefixIcon: Icon(Icons.vpn_key)
                        ),
                        validator: (val){
                                      if (val.isEmpty){
                                        return "Required";
                                      }
                                      else if(val.length < 6){
                                        return "Password is too weak, create a strong password";
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                      ),
                      TextFormField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                          labelText: "Enter Contact no",
                          prefixIcon: Icon(Icons.phone)
                        ),
                        validator: (val){
                          if (val.isEmpty){
                            return "Required";
                            }
                          else if(val.length < 10 || val.length > 10){
                            return "Invalid number format";
                            }
                          else{
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, loginRoute);
            },
            minWidth: 340,
            color: Colors.blue[900],
            textColor: Colors.white,
            shape: StadiumBorder(),
            splashColor: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}