import 'dart:async';

import 'package:advanced_1/preesentaion/resources/colors.dart';
import 'package:advanced_1/preesentaion/resources/constant_manager.dart';
import 'package:advanced_1/preesentaion/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   Timer?  _timer;

   _startDelay(){
     _timer =Timer(const Duration(seconds: ConstantManager.splashDelay),_goNext);
   }
   _goNext(){
     Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
   }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo),)),
    );
  }
  @override
  void dispose() {
     _timer?.cancel();
    super.dispose();
  }
}
