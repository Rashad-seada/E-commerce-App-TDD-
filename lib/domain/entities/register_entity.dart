import 'package:equatable/equatable.dart';
import 'package:evira/core/entities/entities.dart';

class RegisterEntity extends Equatable implements Entity{
  int? statusCode;
  String? message;
  User? user;
  String? token;

  RegisterEntity({this.statusCode, this.message, this.user, this.token});

  RegisterEntity.fromMap(Map<String, dynamic> json) {
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

  @override
  List<Object?> get props => [statusCode,message,user,token,];
}

class User extends Equatable implements Entity{
  int? id;
  String? userName;
  String? email;

  User({this.id, this.userName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['email'] = email;
    return data;
  }

  @override
  List<Object?> get props => [id,userName,email];
}