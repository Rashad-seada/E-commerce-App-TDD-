import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evira/core/error/faliure.dart';
import 'package:evira/core/usecases/usecase.dart';
import 'package:evira/domain/entities/register_entity.dart';
import 'package:evira/domain/repository/auth_repository.dart';

class RegisterNatively implements Usecase<RegisterEntity,RegisterParams>{
  final AuthRepository repository;

  RegisterNatively(this.repository);

  @override
  Future<Either<Failure, RegisterEntity>> call(
      RegisterParams params
      ) async {
    return await repository.registerNatively(params.userName, params.emaill, params.password);
  }
}

class RegisterParams extends Equatable{
  String userName;
  String emaill;
  String password;

  RegisterParams(
      this.userName,
      this.emaill,
      this.password,
      );

  @override
  List<Object?> get props => throw UnimplementedError();

}