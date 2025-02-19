import 'package:advanced_1/preesentaion/forgotpassword/forgotpassword_view.dart';
import 'package:advanced_1/preesentaion/login/login_view.dart';
import 'package:advanced_1/preesentaion/main/main_view.dart';
import 'package:advanced_1/preesentaion/register/register_view.dart';
import 'package:advanced_1/preesentaion/resources/strings_manager.dart';
import 'package:advanced_1/preesentaion/splash/splash_View.dart';
import 'package:advanced_1/preesentaion/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../onboardin/view/onboarding_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";

}

class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> const LoginView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterView());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const MainView());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const StoreDetailsView());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnBoardingView());

      default:
        return unDefiendRoute();



    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFounded),
      ),
      body: const Center(child: Text(AppStrings.noRouteFounded)),
    ));
  }
}