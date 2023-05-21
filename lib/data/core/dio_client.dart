import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String baseUrl = 'https://itunes.apple.com';

class DioClient {
  static Dio get instance {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 60000),
      sendTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      headers: {'Accept': 'application/json'},
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
    );

    final Dio dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, requestHeader: false, responseHeader: false));
    }

    return dio;
  }
}
