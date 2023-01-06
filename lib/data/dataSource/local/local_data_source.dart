import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:evira/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/faliure.dart';

abstract class LocalDataSource {
  /// Gets the cached [Token] which gotten last time
  /// the user [LoggedIn]
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<Either<Failure,String?>> getToken();

  /// Caches the [Token] when the user login to his account
  ///
  Future<void> cacheToken(String token);
}

const TOKEN = 'TOKEN';

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheToken(String token) async {
    try{
      await sharedPreferences.setString(TOKEN,json.encode(token));
    } on CacheException {
      throw CacheFailure('there was an error during caching the token');
    }

  }

  @override
  Future<Either<Failure,String?>> getToken() async{
    try{
      String? token = sharedPreferences.getString(TOKEN);
      return Right(await Future.value(json.decode(token!)));
    } on CacheException {
      return Left(CacheFailure('there was an error during geting the cached token'));
    }

  }

}