import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evira/core/entities/entities.dart';
import 'package:evira/core/error/exception.dart';
import 'package:evira/core/error/faliure.dart';
import 'package:evira/domain/entities/login_entity.dart';
import 'package:evira/domain/entities/register_entity.dart';
import 'package:evira/domain/entities/reset_password_entity.dart';
import 'package:evira/domain/repository/auth_repository.dart';
import '../../core/network/network_info.dart';
import '../dataSource/local/local_data_source.dart';
import '../dataSource/remote/remote_data_source.dart';

typedef LoginOrRegister = Future<Entity> Function();

class AuthRepositoryImpl implements AuthRepository{
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginEntity>> loginNatively(
      String email,
      String password) async{

    if(await networkInfo.isConnected) {
      try {
        final loginEntity = await remoteDataSource.loginNatively(email, password);
        localDataSource.cacheToken(loginEntity.token!);
        return Right(loginEntity);
      } on ServerException {
        return Left(ServerFailure('there was an server error during login'));
      }
    }
    return Left(NetworkConnectionFailure('please check your internet connection'));

  }

  @override
  Future<Either<Failure, RegisterEntity>> registerNatively(
      String userName,
      String email,
      String password) async{
    if(await networkInfo.isConnected){
      try{
        final registerEntity = await remoteDataSource.registerNatively(userName, email, password);
        localDataSource.cacheToken(registerEntity.token!);
        return Right(registerEntity);
      } on DioError {
        return Left(ServerFailure("there was an server error during login"));
      }
    }
    return Left(NetworkConnectionFailure("please check your internet connection"));
  }

  @override
  Future<Either<Failure, ResetPasswordEntity>> resetPassword(String emailOrPassword) async {
   if(await networkInfo.isConnected){
     try{
       final resetPasswordEntity = await remoteDataSource.resetMyPassword(emailOrPassword);
       return Right(resetPasswordEntity);
     } on DioError {
       return Left(ServerFailure("there was an server error during resting your password"));
     }
   }else{
     return Left(NetworkConnectionFailure("please check your internet connection"));
   }
  }

}