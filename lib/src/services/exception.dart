import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  ApiException.fromDioError(Response response)
      : message = response.statusMessage ?? 'Unknown error occurred';

  @override
  String toString() => message;
}
