import 'package:store_vista/data/network/app_api.dart';
import 'package:store_vista/data/network/request.dart';
import 'package:store_vista/data/responses/responces.dart';

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