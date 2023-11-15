import 'package:dio/dio.dart';

import 'api_exception.dart';

final class ApiResponse<T> {
  const ApiResponse(this.statusCode, this.data);

  final int? statusCode;
  final T? data;
}

extension DioResponse<T> on Response<T> {
  ApiResponse<T> toResponseWrapper() {
    return ApiResponse<T>(statusCode, data);
  }

  ApiBadResponse? statusCodeHandler() {
    return switch (statusCode) {
      400 => const ApiBadRequest(statusCode),
      401 => const ApiUnauthorized(statusCode),
      403 => const ApiForbidden(statusCode),
      404 => const ApiMethodNotFound(statusCode),
      405 => const ApiMethodNotAllowed(statusCode),
      500 => const ApiServerError(statusCode),
      503 => const ApiServerUnavailable(statusCode),
      _ => null,
    };
  }
}

extension ApiToDioException on ApiBadResponse {
  DioException toDioException(Response response) {
    return DioException.badResponse(
      statusCode: statusCode ?? 0,
      requestOptions: response.requestOptions,
      response: response,
    );
  }
}
