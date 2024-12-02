import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure {
  final String errMassege;

  Failure({required this.errMassege});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMassege});
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMassege: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMassege: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMassege: 'Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMassege: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResPonse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMassege: 'cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(errMassege: 'No internet connection ');
      case DioExceptionType.unknown:
        return ServerFailure(
            errMassege: 'opps there was an error  , pleas try again');
    }
  }

  factory ServerFailure.fromResPonse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMassege: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(errMassege: 'not Found');
    } else if (statusCode == 500) {
      return ServerFailure(errMassege: 'Internal server error');
    } else {
      return ServerFailure(
          errMassege: 'opps there was an error  , pleas try again');
    }
  }
}
