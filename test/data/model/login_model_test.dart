import 'package:evira/data/models/login_model.dart';
import 'package:evira/domain/entities/login_entity.dart';
import 'package:test/test.dart';
import 'dart:convert';
//import 'package:flutter_test/flutter_test.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final user = User(
    id: 0,
    firstName: 'Rashad',
    lastName: 'Seada',
    email: 'example@gmail.com',
    emailVerifiedAt: '0',
    createdAt: '0',
    updatedAt: '0',
  );

  LoginModel loginModel = LoginModel.fromJson(json.decode(fixtureReader('login.json')));

  LoginModel loginFailureModel = LoginModel.fromJson(json.decode(fixtureReader('login_failure.json')));

  test("should check if Login Model is Equal to Model Entity", () {
    expect(loginModel, isA<LoginEntity>());
  });
  
  group("fromJson", () {
    test(
      'should return a valid model when login success',
      () async {
      //arrange
      final Map<String,dynamic> jsonMap =
      json.decode(fixtureReader('login.json'));
      //act
      final result = LoginModel.fromJson(jsonMap);
      //assert
      expect(result.statusCode, 200);
      }
    );

    test(
      'should return a valid model when login failure',
      () async {
      //arrange
      Map<String,dynamic> jsonMap =
      json.decode(fixtureReader('login_failure.json'));
      //act
      LoginModel result = LoginModel.fromJson(jsonMap);
      //assert
      expect(result.statusCode, 400);
      }
    );
  });

  group('toJson', () {
    test(
      'should return a valid json format with a proper data',
      () async {
      //act
      final result = loginModel.toJson();
      final expectedMap = {
        "statusCode": 200,
        "message": "you have been logged in successfully",
        "user": {
          "id": 0,
          "first_name": "Rashad",
          "last_name": "Seada",
          "email": "example@gmail.com",
          "email_verified_at": "0",
          "created_at": "0",
          "updated_at": "0"
        },
        "token": "0"
      };
      //assert
      expect(result, expectedMap);
      });
  });

  test('Login Model is a sub class of Login Entity', () {
    expect(loginModel, isA<LoginEntity>());
  });
}
