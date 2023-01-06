import 'package:equatable/equatable.dart';
///----------------------- [GeneralFailures] -----------------------
///
/// A general [Failure] type
class Failure extends Equatable {
  final String message;

  List<dynamic> properties;
  Failure(this.message,{this.properties = const <dynamic>[]});

  @override
  List<Object?> get props => properties;
}

/// A Failure thrown when [ServerFailure] happens
class ServerFailure extends Failure {
  ServerFailure(String message):super(message);
}

/// A Failure thrown when [CacheFailure] happens
class CacheFailure extends Failure {
  CacheFailure(String message):super(message);

}

/// A Failure thrown when [NetworkConnectionFailure] happens
class NetworkConnectionFailure extends Failure {
  NetworkConnectionFailure(String message):super(message);

}