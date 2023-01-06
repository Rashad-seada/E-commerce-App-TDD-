import 'package:equatable/equatable.dart';
import 'package:evira/core/entities/entities.dart';

class LoginEntity extends Equatable implements Entity{
  int? statusCode;
  String? message;
  User? user;
  String? token;

  LoginEntity({this.statusCode, this.message, this.user, this.token});

  LoginEntity.fromMap(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    user = User.fromMap(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['user'] = user!.toMap();
    data['token'] = token;
    return data;
  }

  @override
  List<Object?> get props => [statusCode ,message ,user ,token];
}

class User extends Equatable implements Entity{
  int? id;
  String? userName;
  String? email;

  User(
      {this.id,
        this.userName,
        this.email,
       });

  User.fromMap(Map<String, dynamic>? json) {
    id = json?['id'];
    userName = json?['user_name'];
    email = json?['email'];

  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['email'] = email;
    return data;
  }

  @override
  List<Object?> get props => [id,userName,email];
}