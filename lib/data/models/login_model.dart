import 'package:evira/core/models/models.dart';
import 'package:evira/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity implements Model{

  LoginModel({
    int? statusCode,
    String? message,
    User? user,
    String? token,
  }) : super(
    statusCode: statusCode,
    message: message,
    user: user,
    token: token,
  );

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    user = User.fromMap(json['user'] as Map<String, dynamic>?);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['user'] = user!.toMap();
    data['token'] = token;
    return data;
  }


}