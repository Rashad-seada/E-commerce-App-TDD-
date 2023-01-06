import 'package:evira/core/error/faliure.dart';
import 'package:evira/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';
import '../entities/register_entity.dart';
import '../entities/reset_password_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure,LoginEntity>> loginNatively(
      String email,
      String password
      );

  Future<Either<Failure,RegisterEntity>> registerNatively(
      String userName,
      String email,
      String password,
      );

  Future<Either<Failure,ResetPasswordEntity>> resetPassword(
      String emailOrPhoneNumber,
      );
}