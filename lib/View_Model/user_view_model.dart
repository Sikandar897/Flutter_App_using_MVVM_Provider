import 'package:flutter/material.dart';
import 'package:mvvm_app/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  /* To save user with the toekn we have from the third party api or librrary*/

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  /*Above we have set user below we have get user*/
  Future<UserModel> getUser()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');


    return UserModel(
      token: token.toString()
    );
  }

  /* To remove user just like when they logout we will remove the user using this token */
  
  Future<bool> remove() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}