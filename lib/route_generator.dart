import 'package:flutter/material.dart';
import 'package:flutter_master_template/src/screen/register_screen.dart';
import 'package:flutter_master_template/src/screen/restaurants_screen.dart';
import 'package:flutter_master_template/src/screen/splash_screen.dart';
import 'package:flutter_master_template/src/screen/welcome_screen.dart';
import 'package:flutter_master_template/src/screen/dashboard_screen.dart';
import 'package:flutter_master_template/src/screen/profile_screen.dart';
import 'package:flutter_master_template/src/screen/login_screen.dart';

const String splashRoute = '/Splash';
const String loginRoute = '/Login';
const String welcomeRoute = '/Welcome';
const String dashboardRoute = '/Dashboard';
const String profileRoute = '/Profile';
const String restaurantsRoute = '/Restaurants';
const String registerRoute = '/Register';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
     
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case restaurantsRoute:
        return MaterialPageRoute(builder: (_) => RestaurantsScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: SizedBox(height: 0)));
    }
  }
}
