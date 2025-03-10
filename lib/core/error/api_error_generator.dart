import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/core/error/error.dart';

class ApiErrorGenerator {
  ApiErrorGenerator._();
  static Failure apiError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badCertificate:
        return BadCertificateFailure(message: error.message ?? '');
      case DioExceptionType.cancel:
        return CancelFailure(message: error.message ?? '');
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return BadRequestFailure(
                message: jsonEncode(error.response?.data['message']));
          case 403:
            return UnauthorizedFailure(
                message: jsonEncode(error.response?.data['message']));
          case 401:
            return UnauthorizedFailure(
                message: error.response?.data['message']);
          case 434:
            return UnauthorizedFailure(
                message: jsonEncode(error.response?.data['message']));
          case 404:
            return NotFoundFailure(
                message: jsonEncode(error.response?.data['message']));
          case 409:
            return NotFoundFailure(
                message: error.response?.data['message']);
          case 422:
            return InternalServerFailure(
                message: error.response?.data['message']);
          case 500:
            return InternalServerFailure(
                message: error.response?.data['message']);

          default:
            return UnknownFailure(message: 'Something Wrong');
        }
      case DioExceptionType.connectionError:
        return ConnectionFailure(message: error.message ?? '');
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DeadlineExceededFailure(message: error.message ?? '');
      default:
        return NoInternetFailure();
    }
  }
}
