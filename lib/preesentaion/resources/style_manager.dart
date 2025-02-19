
import 'package:advanced_1/preesentaion/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize ,
    FontWeight fontWeight, Color color )
{
  return TextStyle(
    fontSize: fontSize ,fontFamily: FontConstant.fontFamily,
      color: color,fontWeight: fontWeight,
  );
}

// regular Style
 TextStyle getRegular({double  fontSize = FontSize.s12,required Color color } ){
  return _getTextStyle(fontSize, FontWeightManager.regular, color );
 }

// medium Style
TextStyle getMedium({double fontSize = FontSize.s12,required Color color } ){
  return _getTextStyle(fontSize, FontWeightManager.medium, color );
}

// bold Style
TextStyle getBold({double fontSize = FontSize.s12,required Color color } ){
  return _getTextStyle(fontSize, FontWeightManager.bold, color );
}
// semiBold Style
TextStyle getSemiBold({double fontSize = FontSize.s12,required Color color } ){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color );
}
// getLight

TextStyle getLight({double fontSize = FontSize.s12,required Color color } ){
  return _getTextStyle(fontSize, FontWeightManager.light, color );
}