import 'package:advanced_1/data/network/Failure.dart';
import 'package:advanced_1/data/network/request.dart';
import 'package:advanced_1/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
  // ignore: non_constant_identifier_names
  Future< Either<Failure,Authentication>> login(LoginRequest LoginRequest);
}