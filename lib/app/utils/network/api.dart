import 'package:dio/dio.dart';
import 'api_exception.dart';
import 'api_response.dart';

final class Api {
  const Api(this._dio);

  final Dio _dio;

  Future<ApiResponse<T?>> get<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<T?> response = await _dio.get<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.toResponseWrapper();
    } on DioException catch (e, stackTrace) {
      final apiException = ApiException.of(e);
      Error.throwWithStackTrace(apiException, stackTrace);
    }
  }

  Future<ApiResponse<T?>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<T?> response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.toResponseWrapper();
    } on DioException catch (e, stackTrace) {
      final apiException = ApiException.of(e);
      Error.throwWithStackTrace(apiException, stackTrace);
    }
  }

  Future<ApiResponse<T?>> delete<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response<T?> response = await _dio.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.toResponseWrapper();
    } on DioException catch (e, stackTrace) {
      final apiException = ApiException.of(e);
      Error.throwWithStackTrace(apiException, stackTrace);
    }
  }

  Future<ApiResponse<T?>> put<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.toResponseWrapper();
    } on DioException catch (e, stackTrace) {
      final apiException = ApiException.of(e);
      Error.throwWithStackTrace(apiException, stackTrace);
    }
  }

  Future<ApiResponse<T?>> head<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.head<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.toResponseWrapper();
    } on DioException catch (e, stackTrace) {
      final apiException = ApiException.of(e);
      Error.throwWithStackTrace(apiException, stackTrace);
    }
  }

  Future<ApiResponse<T>> patch<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.toResponseWrapper();
    } on DioException catch (e, stackTrace) {
      final apiException = ApiException.of(e);
      Error.throwWithStackTrace(apiException, stackTrace);
    }
  }
}
