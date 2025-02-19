  import 'package:advanced_1/preesentaion/resources/colors.dart';
import 'package:advanced_1/preesentaion/resources/font_manager.dart';
import 'package:advanced_1/preesentaion/resources/style_manager.dart';
import 'package:advanced_1/preesentaion/resources/values_manager.dart';
  import 'package:flutter/material.dart';

  ThemeData getAppTheme(){
    return ThemeData(
  // main colors
  primaryColor: ColorsManager.primary,
  primaryColorLight: ColorsManager.lightPrimary,
  primaryColorDark: ColorsManager.darkPrimary,
  disabledColor: ColorsManager.grey1,
      splashColor: ColorsManager.lightPrimary,   //ripple effect color

      //cardView theme
      cardTheme: CardTheme(
        color: ColorsManager.white,
        shadowColor: ColorsManager.gray,
        elevation: AppSize.s4,
      ),


      //app bar theme
    appBarTheme: AppBarTheme(centerTitle: true,
    color: ColorsManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorsManager.lightPrimary,
      titleTextStyle:
      getRegular( fontSize: FontSize.s16,color: ColorsManager.white)
      
    ),




      // button theme
 buttonTheme: ButtonThemeData(
   shape: const StadiumBorder(),
   disabledColor: ColorsManager.grey1,
   buttonColor: ColorsManager.primary,
   splashColor: ColorsManager.lightPrimary,
   
 ),

  // elevated Button Theme
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: getRegular(color: ColorsManager.white ,fontSize: FontSize.s17),
      backgroundColor: ColorsManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    )
  ),

        // text theme
  textTheme: TextTheme(
    displayLarge: getLight(color: ColorsManager.white,fontSize: FontSize.s22),
    headlineLarge: getSemiBold(color: ColorsManager.darGray,fontSize: FontSize.s16),
    titleMedium: getMedium(color: ColorsManager.lightGray,fontSize: FontSize.s14),
    bodyLarge: getRegular(color: ColorsManager.grey1) ,
    bodySmall: getRegular(color: ColorsManager.gray),

  ),


      //input decoration theme (text from field)

    inputDecorationTheme: InputDecorationTheme(
      // 1- content padding
      contentPadding: const EdgeInsets.all(APPPaddingManager.p8),
      // 2- hintStyle padding
      hintStyle: getRegular(color: ColorsManager.gray,fontSize: FontSize.s14),
      // 3- labelStyle
      labelStyle: getMedium(color: ColorsManager.gray,fontSize: FontSize.s14),
      // 4- errorStyle
      errorStyle: getRegular(color: ColorsManager.error,),
      // 5- enabledBorder
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

      // 6-focusedBorder
      focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.gray,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // 7- errorBorderStyle
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.error,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),


      // 8- focusedErrorBorder
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

    ) ,

    );
  }