import 'package:dio/dio.dart';

import 'api_contants.dart';
import 'api_interceptor.dart';

class DioProvider {

  final Dio _dio;
  DioProvider(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll({
        AppInterceptors(_dio),
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        )
      });
  }

  Dio get client =>
      _dio;

}
