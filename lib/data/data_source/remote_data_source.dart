import 'package:advanced_1/data/network/app_api.dart';
import 'package:advanced_1/data/network/request.dart';
import 'package:advanced_1/data/responses/responces.dart';

abstract class RemoteDataSource {
 Future<AuthenticationResponce> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthenticationResponce> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password
  );
  }

}