import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evira/core/error/faliure.dart';
import 'package:evira/domain/repository/auth_repository.dart';
import '../../core/usecases/usecase.dart';
import '../entities/login_entity.dart';

class LoginNatively implements Usecase<LoginEntity,LoginParams>{
  final AuthRepository authRepository;

  LoginNatively(this.authRepository);

  Future<Either<Failure,LoginEntity>> call(
      LoginParams params,
  ) async {
    return await authRepository.loginNatively(params.email, params.password);
  }

}

class LoginParams extends Equatable{
  String email;
  String password;

  LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

}