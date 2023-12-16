import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/Repository/auth_repository.dart';
import 'package:mvvm_app/Utils/Routes/routes_name.dart';
import 'package:mvvm_app/Utils/utils.dart';

class AuthViewModel with ChangeNotifier {

  /* defining bool vlaues for loading*/
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;


  // method for loadiing
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // method for SignUP loadiing
  setSignUPLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();

  /* Here is code for hitting login Api*/

  Future<void> loginApi(dynamic data, BuildContext context) async {
    
    setLoading(true); //when my api hit loading will appear

    _myRepo.loginAPi(data).then((value) {
      setLoading(false); //when i get response loading will appear
      Utils.flashBarErrormessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false); //when i got exception loading will appear
      if (kDebugMode) {
        Utils.flashBarErrormessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
  

  /* Here is code for hitting SingUp Api*/

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    
    setSignUPLoading(true); //when my api hit loading will appear

    _myRepo.signUpAPi(data).then((value) {
      setSignUPLoading(false); //when i get response loading will appear
      Utils.flashBarErrormessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUPLoading(false); //when i got exception loading will appear
      if (kDebugMode) {
        Utils.flashBarErrormessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

}
