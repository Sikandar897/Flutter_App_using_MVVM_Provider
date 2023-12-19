// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/Model/user_model.dart';
import 'package:mvvm_app/Utils/Routes/routes_name.dart';
import 'package:mvvm_app/View/login_screen.dart';
import 'package:mvvm_app/View_Model/user_view_model.dart';

class SplashServices with ChangeNotifier {
  //method create for get data from future method UserViewModel
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      //if value is null or empty move me to this screen
      if (value.token == 'null' || value.token == '') {
       await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView(),));
      } else {
        Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
