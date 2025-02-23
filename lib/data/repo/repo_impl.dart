import 'package:advanced_1/data/data_source/remote_data_source.dart';
import 'package:advanced_1/data/mappers/mapper.dart';
import 'package:advanced_1/data/network/Failure.dart';
import 'package:advanced_1/data/network/error_handeller.dart';
import 'package:advanced_1/data/network/network_info.dart';
import 'package:advanced_1/data/network/request.dart';
import 'package:advanced_1/domain/models/models.dart';
import 'package:advanced_1/domain/repo/repo_login.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest LoginRequest) async {
    if (await _networkInfo.isConnected) {
      //its safe call Api
      final response = await _remoteDataSource.login(LoginRequest);
      try {
  if (response.status == ApiInternet.success) {
    //success
    // return either right
    // return data
    return Right(response.toDomain());
  } else {
    // failure -- business error
    // return either left
    return Left(Failure(ApiInternet.failure, response.massage ??ResponseMessages.requestTimeout));
  }
} on Exception catch (e) {
  return left(ErrorHandler.handle(e).failure);
}
    } else {
      // return internet connection service
      return Left(DataSource.notImplemented.getFailure());
    }
  }
}
