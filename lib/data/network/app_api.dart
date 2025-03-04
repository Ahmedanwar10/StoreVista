
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store_vista/app/constant.dart';
import 'package:store_vista/data/responses/responces.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient{
factory AppServiceClient(Dio dio ,{String? baseUrl}) = _AppServiceClient;

@POST("/customers/login")
Future<AuthenticationResponce>login(
  @Field("email") String email, @Field("password") String password,

);
}
