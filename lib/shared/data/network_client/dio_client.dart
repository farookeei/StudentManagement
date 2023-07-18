import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../config/env/env_model.dart';
import 'dio_interceptors.dart';

class DioClient {
  static final Dio _dio = Dio();
  static final DioClient _singleton = DioClient._internal();

  DioClient._internal() {
    final String baseUrl = Environment().config!.apiHost;

    _dio
          ..options.baseUrl = baseUrl
          ..options.connectTimeout = 60 * 1000
          ..options.receiveTimeout = 60 * 1000
          ..interceptors.add(
            AwesomeDioInterceptor(baseUrl: baseUrl),
          ) // create a new Dio instance
        ;
  }

  factory DioClient() {
    return _singleton;
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  void setDefaultHeaders(Map<String, dynamic> headers) {
    _dio.options.headers = headers;
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

// Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      log(response.toString());

      return response;
    } catch (e) {
      rethrow;
    }
  }

// Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    dynamic data,

    // CancelToken? cancelToken,
    // ProgressCallback? onSendProgress,
    // ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Patch:----------------------------------------------------------------------
  Future<Response> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    // CancelToken? cancelToken,
    // ProgressCallback? onSendProgress,
    // ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void init(String baseUrl) {
    //TODO initializeInterceptors();
  }
}
