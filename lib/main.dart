import 'package:flutter/material.dart';
import 'package:flutter_master_template/theme_data.dart';
import 'route_generator.dart';

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SandyTech Master Template',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: splashRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
