import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:evira/core/platform/network_info.dart';
import 'package:evira/data/dataSource/local/local_data_source.dart';
import 'package:evira/data/dataSource/remote/remote_data_source.dart';
import 'package:evira/data/models/login_model.dart';
import 'package:evira/data/repository/auth_repository_impl.dart';
import 'package:evira/domain/entities/login_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock
    implements RemoteDataSource {}

class MockLocalDataSource extends Mock
    implements LocalDataSource {}

class MockNetworkInfo extends Mock
    implements NetworkInfo {}

void main() {
  late AuthRepositoryImpl repository;
  late MockRemoteDataSource remoteDataSource;
  late MockLocalDataSource localDataSource;
  late MockNetworkInfo networkInfo;

  setUp(() {
    remoteDataSource = MockRemoteDataSource();
    localDataSource = MockLocalDataSource();
    networkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );
  });

  String tEmail = 'example@gmail.com';
  String tPassword = '8291917Mn';

  LoginModel tLoginModel = LoginModel.fromJson(
     json.decode(fixtureReader('login.json'))
  );

  LoginEntity tLoginEntity = tLoginModel;


  group('loginNatively', () {
    test(
      'should check if the device is online', 
      () async{
        // arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.loginNatively(tEmail, tPassword);
        //assert
        verify(networkInfo.isConnected);
      });
  }
  );

  group('device is online', () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should login when the call to remote data is successful', () async {
      // arrange
      when(remoteDataSource.loginNatively(tEmail, tPassword))
          .thenAnswer((_) async => tLoginModel);
      // act
      final result = await repository.loginNatively(tEmail, tPassword);
      // assert
      verify(remoteDataSource.loginNatively(tEmail, tPassword));
      expect(result, equals(Right(tLoginEntity)));
    });

    test('should cache token when the call to remote data is successful', () async {
      // arrange
      when(remoteDataSource.loginNatively(tEmail, tPassword))
          .thenAnswer((_) async => tLoginModel);
      // act
      await repository.loginNatively(tEmail, tPassword);
      // assert
      verify(remoteDataSource.loginNatively(tEmail, tPassword));
      verify(localDataSource.cacheToken(tLoginModel));
    });
  });

  group('device is offline', () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('should login with failure when the call to remote data is failed', () async {

    });
  });
}