import 'package:dio/dio.dart';

abstract class Failures {
  final String errorText;

  Failures(this.errorText);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorText);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout");

      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");

      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode,
          e.response?.data,
        );

      default:
        return ServerFailure("Unexpected error");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(response['message'] ?? "Bad Request");

      case 401:
        return ServerFailure("Unauthorized");

      case 403:
        return ServerFailure("Forbidden");

      case 404:
        return ServerFailure("Not Found");

      case 500:
        return ServerFailure("Internal Server Error");

      default:
        return ServerFailure("Unexpected Server Error");
    }
  }
}
