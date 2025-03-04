import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:store_vista/app/app_prefernces.dart';
import 'package:store_vista/app/constant.dart';
const String APPLICATION_JSON ='application/json';
const String  CONTENT_TYPE ='content-type';

const String ACCEPT ='accept';
const String AUTHORIZATION ='authorization';
const String DEFAULT_LANGUAGE ='default-language';

class DioFactory {
 final  AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

 Future<Dio>getDio()async{
  Dio dio =Dio();

   int _timeOut =60*1000;

   String language =await _appPreferences.getAppLang();
  Map<String,String> headers =
  {
    CONTENT_TYPE:APPLICATION_JSON,
    ACCEPT:APPLICATION_JSON,
    AUTHORIZATION:Constant.token,
    DEFAULT_LANGUAGE:language,

  };
  dio.options =BaseOptions(
    baseUrl: Constant.baseUrl,
    headers: headers,
    receiveTimeout: Duration(milliseconds: _timeOut),
    sendTimeout: Duration(milliseconds: _timeOut),
  );
   if(!kReleaseMode){
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      )
    );
   }
    return dio;

 }
}
