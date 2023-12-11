import 'package:flutter/material.dart';
import 'package:mvvm_app/Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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