import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evira/domain/repository/auth_repository.dart';
import '../../core/error/faliure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/reset_password_entity.dart';

class ResetPassword implements Usecase<ResetPasswordEntity,ResetPasswordParams>{
  final AuthRepository authRepository;

  ResetPassword(this.authRepository);

  @override
  Future<Either<Failure,ResetPasswordEntity>> call(
      ResetPasswordParams params,
      ) async {
    return  authRepository.resetPassword(params.emailOrPassword);
  }

}

class ResetPasswordParams extends Equatable{
  String emailOrPassword;

  ResetPasswordParams({required this.emailOrPassword});

  @override
  List<Object?> get props => throw [emailOrPassword];
}