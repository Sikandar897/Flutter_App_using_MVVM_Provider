
import 'package:flutter/material.dart';
import 'package:mvvm_app/Utils/Routes/routes_name.dart';
import 'package:mvvm_app/View/home_screen.dart';
import 'package:mvvm_app/View/login_screen.dart';
import 'package:mvvm_app/View/signup_view.dart';
import 'package:mvvm_app/View/splash_view.dart';

class Routes {

  static Route<dynamic> generateRoute (RouteSettings setting){

    switch(setting.name){

      case RoutesName.splash:
      return MaterialPageRoute(builder: (context)=> const SplashView());

      case RoutesName.home:
      return MaterialPageRoute(builder: (context)=> const HomeScreen());

      case RoutesName.login:
      return MaterialPageRoute(builder: (context)=> const LoginView());
      
      case RoutesName.signUp:
      return MaterialPageRoute(builder: (context)=> const SignUpView());

      default:
      return MaterialPageRoute(builder: (context)=> const Scaffold(
        body: Center(
          child: Text('No route defined'),
        ),
      ));

    }
  }
}