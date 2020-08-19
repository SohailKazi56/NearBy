import 'package:flutter/material.dart';
import 'package:flutter_master_template/src/widgets/profileUI.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF002da5),
        title: Text("Profile",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
      ),
      body: ProfileUI(),
      );
  }
}