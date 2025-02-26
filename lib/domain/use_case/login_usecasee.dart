// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advanced_1/data/network/Failure.dart';
import 'package:advanced_1/data/network/request.dart';
import 'package:advanced_1/domain/models/models.dart';
import 'package:advanced_1/domain/repo/repo_login.dart';
import 'package:advanced_1/domain/use_case/ase_usecase.dart';
import 'package:dartz/dartz.dart';

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
