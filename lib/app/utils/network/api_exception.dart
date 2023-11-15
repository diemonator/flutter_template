import 'package:dio/dio.dart';

sealed class ApiException implements Exception {
  const ApiException([this.message]);

  final String? message;

  static ApiException of(DioException e) {
    final message = e.message;

    return switch (e.type) {
      DioExceptionType.connectionTimeout => ApiConnectTimeout(message),
      DioExceptionType.sendTimeout => ApiSendTimeout(message),
      DioExceptionType.receiveTimeout => ApiReceiveTimeout(message),
      DioExceptionType.badCertificate => ApiBadCertificates(message),
      DioExceptionType.cancel => ApiCancelRequest(message),
      DioExceptionType.connectionError => ApiBadConnection(message),
      DioExceptionType.badResponse => ApiBadResponse(
          e.response?.statusCode ?? 0,
          message,
        ),
      DioExceptionType.unknown => ApiUnknownException(message),
    };
  }
}

final class ApiUnknownException extends ApiException {
  const ApiUnknownException([super.message]);
}

final class ApiBadConnection extends ApiException {
  const ApiBadConnection([super.message]);
}

final class ApiCancelRequest extends ApiException {
  const ApiCancelRequest([super.message]);
}

final class ApiBadCertificates extends ApiException {
  const ApiBadCertificates([super.message]);
}

final class ApiReceiveTimeout extends ApiException {
  const ApiReceiveTimeout([super.message]);
}

final class ApiSendTimeout extends ApiException {
  const ApiSendTimeout([super.message]);
}

final class ApiConnectTimeout extends ApiException {
  const ApiConnectTimeout([super.message]);
}

final class ApiBadResponse extends ApiException {
  const ApiBadResponse(this.statusCode, [super.message]);

  final int statusCode;
}

final class ApiServerUnavailable extends ApiBadResponse {
  const ApiServerUnavailable(super.statusCode, [super.message]);
}

final class ApiServerError extends ApiBadResponse {
  const ApiServerError(super.statusCode, [super.message]);
}

final class ApiMethodNotFound extends ApiBadResponse {
  const ApiMethodNotFound(super.statusCode, [super.message]);
}

final class ApiMethodNotAllowed extends ApiBadResponse {
  const ApiMethodNotAllowed(super.statusCode, [super.message]);
}

final class ApiBadRequest extends ApiBadResponse {
  const ApiBadRequest(super.statusCode, [super.message]);
}

final class ApiUnauthorized extends ApiBadResponse {
  const ApiUnauthorized(super.statusCode, [super.message]);
}

final class ApiForbidden extends ApiBadResponse {
  const ApiForbidden(super.statusCode, [super.message]);
}
