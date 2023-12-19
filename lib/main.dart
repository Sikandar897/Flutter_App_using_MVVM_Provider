import 'package:flutter/material.dart';
import 'package:mvvm_app/Utils/Routes/routes.dart';
import 'package:mvvm_app/Utils/Routes/routes_name.dart';
import 'package:mvvm_app/View_Model/auth_view_model.dart';
import 'package:mvvm_app/View_Model/user_view_model.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Multi Provider
  // define models here 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_)=> AuthViewModel()),
      ChangeNotifierProvider(create: (_)=> UserViewModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: RoutesName.splash,
     onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}