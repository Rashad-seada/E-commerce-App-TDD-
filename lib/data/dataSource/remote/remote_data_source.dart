import 'package:evira/core/error/exception.dart';
import 'package:evira/data/models/login_model.dart';
import '../../models/register_model.dart';
import '../../models/reset_password_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  /// Calls the [login] endpoint
  ///
  /// Throws a [ServerException] for all error code.
  Future<LoginModel> loginNatively(String email, String password);

  /// Calls the [register] endpoint
  ///
  /// Throws a [ServerException] for all error code.
  Future<RegisterModel> registerNatively(String userName,String email, String password);

  /// Calls the [reset_password] endpoint
  ///
  /// Throws a [ServerException] for all error code.
  Future<ResetPasswordModel> resetMyPassword(String method);
}

class RemoteDataSourceImpl implements  RemoteDataSource{
  Dio client;
  String baseUrl;

  RemoteDataSourceImpl({
    required this.client,
    required this.baseUrl}
      );

  @override
  Future<LoginModel> loginNatively(String email, String password) async {
    String endPoint = "/login";
    Response response;
    LoginModel loginModel;
    Map data = {
      "email" : email,
      "password": password,
    };

    response = await client.post(
        baseUrl + endPoint,
        data: data,
        options: Options()
    );
    loginModel = LoginModel.fromJson(response.data);
    return loginModel;
  }

  @override
  Future<RegisterModel> registerNatively(String userName, String email, String password) async{
    String endPoint = "/register";
    Response response;
    RegisterModel registerModel;
    Map data = {
      "user_name": userName,
      "email" : email,
      "password": password,
    };

    response = await client.post(
        baseUrl + endPoint,
        data: data,
        options: Options()
    );
    registerModel = RegisterModel.fromJson(response.data);
    return registerModel;
  }

  @override
  Future<ResetPasswordModel> resetMyPassword(String emailOrPhoneNumber) async{
    String endPoint = "/resetMyPassword";
    Response response;
    ResetPasswordModel resetPasswordModel;
    Map data = {
      "email_or_number" : emailOrPhoneNumber,
    };

    response = await client.post(
        baseUrl + endPoint,
        data: data,
        options: Options()
    );
    resetPasswordModel = ResetPasswordModel.fromJson(response.data);
    return resetPasswordModel;
  }

}