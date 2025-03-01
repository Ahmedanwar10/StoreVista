import 'package:advanced_1/data/network/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase <In,Out>{
Future<Either<Failure,Out>>execute(In input);
}