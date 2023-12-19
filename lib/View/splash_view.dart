import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:mvvm_app/View_Model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<StatefulWidget> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
      SplashServices splashServices = SplashServices();
  late AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  /* it will dispose the controller means just to make sure screen is disconnected with the controller*/
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*why animate builder? because i want my logo to be rotate during animation */
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: animationController.value * 2.0 * math.pi,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:
                        Center(child: Image.asset('assets/images/logo.png')),
                  ),
                );
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'ItsElexnder LLC',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}