import 'package:dartz/dartz.dart';
import 'package:store_vista/data/network/Failure.dart';
import 'package:store_vista/data/network/request.dart';
import 'package:store_vista/domain/models/models.dart';
import 'package:store_vista/domain/repo/repo_login.dart';
import 'package:store_vista/domain/use_case/ase_usecase.dart';

class LoginUseCasee implements BaseUseCase<LoginUseCaseInput,Authentication>{
  final Repository _repository;
  LoginUseCasee(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input)async {
   return  await _repository.login(LoginRequest(input. email,input. password));
  }

  
}


class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(
     this.email,
     this.password,
  );
}
