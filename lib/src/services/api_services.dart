import 'package:bloc_example/src/common/model/api_model.dart';
import 'package:bloc_example/src/services/exception.dart';
import 'package:bloc_example/src/utils/api_url.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<ApiModel> call(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();

    try {
      Response response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      if (response.data == null) {
        throw ApiException('Received empty response from the server.');
      }

      return ApiModel.fromJson(response.data);
    } on DioException catch (err) {
      _handleDioError(err);
    } catch (err) {
      rethrow;
    }

    throw ApiException(
        'An unexpected error occurred while processing your request.');
  }

  void _handleDioError(DioException err) {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      throw ApiException(
          "Please check your Wi-Fi or data connection and try again.");
    }

    if (err.response != null) {
      throw ApiException.fromDioError(err.response!);
    }

    throw ApiException("An unexpected error occurred.");
  }
}
