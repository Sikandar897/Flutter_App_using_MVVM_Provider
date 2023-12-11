import 'package:flutter/material.dart';
import 'package:mvvm_app/Utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FloatingActionButton(onPressed: (){

            //Utils.toastMessage('No internet connection');
            Utils.snackBar('oops No connection!', context);

          },child: const Text('button'),) 
        ],
      ),
    );
  }
}