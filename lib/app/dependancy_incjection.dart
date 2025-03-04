
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_vista/app/app_prefernces.dart';
import 'package:store_vista/data/data_source/remote_data_source.dart';
import 'package:store_vista/data/network/app_api.dart';
import 'package:store_vista/data/network/dio_factory.dart';
import 'package:store_vista/data/network/network_info.dart';
import 'package:store_vista/data/repo/repo_impl.dart';
import 'package:store_vista/domain/repo/repo_login.dart';
import 'package:store_vista/domain/use_case/login_usecasee.dart';
import 'package:store_vista/preesentaion/login/view_model/login_view_model.dart';

final instance =GetIt.instance;
Future<void> initAppModule() async {
  final SharedPreference = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(()=>SharedPreference);// استخدمت lazy علشان الميمورس تفضل خامله لحد ما استدعيها

  instance.registerLazySingleton<AppPreferences>(()=>AppPreferences(instance()));
   // network info instance
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker.createInstance()));
   // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
    // app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(()=>AppServiceClient(dio));
    //remote date source
  instance.registerLazySingleton<RemoteDataSource>(()=>RemoteDataSourceImpl(instance()));
    //repository
  instance.registerLazySingleton<Repository>(()=>RepositoryImpl(instance(), instance()));

}

initLoginModule()  {
  if(!GetIt.I.isRegistered<LoginUseCasee>()){
  instance.registerFactory<LoginUseCasee>(()=>LoginUseCasee(instance()));
  instance.registerFactory<LoginViewModel>(()=>LoginViewModel(instance()));
  }
 
}
