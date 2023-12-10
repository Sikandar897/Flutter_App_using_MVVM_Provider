
import 'package:flutter/material.dart';
import 'package:mvvm_app/Utils/Routes/routes_name.dart';
import 'package:mvvm_app/View/home_screen.dart';
import 'package:mvvm_app/View/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoute (RouteSettings setting){

    switch(setting.name){
      case RoutesName.home:
      return MaterialPageRoute(builder: (context)=> const HomeScreen());

      case RoutesName.login:
      return MaterialPageRoute(builder: (context)=> const LoginScreen());

      default:
      return MaterialPageRoute(builder: (context)=> const Scaffold(
        body: Center(
          child: Text('No route defined'),
        ),
      ));

    }
  }
}