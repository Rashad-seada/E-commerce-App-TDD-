import 'package:dartz/dartz.dart';
import '../error/faliure.dart';

abstract class Usecase<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}