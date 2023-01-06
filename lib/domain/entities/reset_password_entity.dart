import 'package:equatable/equatable.dart';
import '../../core/entities/entities.dart';

class ResetPasswordEntity extends Equatable implements Entity{
  int? statusCode;
  String? message;

  ResetPasswordEntity({this.statusCode, this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }

  @override
  List<Object?> get props => [statusCode,message];
}