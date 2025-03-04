import 'package:dartz/dartz.dart';
import 'package:store_vista/data/network/Failure.dart';
import 'package:store_vista/data/network/request.dart';
import 'package:store_vista/domain/models/models.dart';

abstract class Repository{
  // ignore: non_constant_identifier_names
  Future< Either<Failure,Authentication>> login(LoginRequest LoginRequest);
}