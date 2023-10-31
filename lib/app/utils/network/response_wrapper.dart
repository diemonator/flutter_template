import 'package:dio/dio.dart';

final class ResponseWrapper<T> {
  const ResponseWrapper(this.statusCode, this.data);

  final int? statusCode;
  final T? data;
}

extension DioResponseWrapper<T> on Response<T> {
  ResponseWrapper<T> toResponseWrapper() => ResponseWrapper<T>(
        statusCode,
        data,
      );
}
