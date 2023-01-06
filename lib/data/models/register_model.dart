import 'package:evira/core/models/models.dart';
import 'package:evira/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity implements Model{

  RegisterModel({
    int? statusCode,
    String? message,
    User? user,
    String? token
  }):super(
    statusCode: statusCode,
    message: message,
    user: user,
    token: token
  );

  RegisterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}
