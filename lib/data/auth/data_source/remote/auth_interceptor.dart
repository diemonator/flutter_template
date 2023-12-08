import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/utils/network/api_exception.dart';
import '../../../../core/utils/network/api_response.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authHeaders, this._refreshToken);

  final Map<String, dynamic> Function() _authHeaders;
  final AsyncResult<Unit, Exception> Function() _refreshToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = _authHeaders();

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final result = response.statusCodeHandler();

    if (result != null) {
      switch (result) {
        case ApiUnauthorized _ || ApiForbidden _:
          return _refreshToken().fold(
            (success) => handler.next(response),
            (error) => handler.reject(result.toDioException(response)),
          );
        default:
          return handler.next(response);
      }
    }

    return handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.reject(err);
  }
}
