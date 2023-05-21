import 'dart:io';

import 'package:dio/dio.dart' hide Headers;

const int defaultErrorCode = -1;
const int socketErrorCode = -4;

class ServerException implements Exception {
  final int errorCode;
  final String errorMessage;
  final String errorTitle;

  const ServerException._({
    this.errorCode = defaultErrorCode,
    required this.errorMessage,
    required this.errorTitle,
  });

  factory ServerException.withMessage(
      {required String title, required String message, int? statusCode}) {
    return ServerException._(
      errorCode: statusCode ?? defaultErrorCode,
      errorMessage: message,
      errorTitle: title,
    );
  }

  factory ServerException.withError(DioError error) {
    return _handleError(error);
  }

  static ServerException _handleError(DioError error) {
    int code = defaultErrorCode;
    String message = '';
    String title = '';

    switch (error.type) {
      case DioErrorType.cancel:
        title = 'Oh no...';
        message = 'Request was cancelled';
        break;
      case DioErrorType.connectionTimeout:
        title = 'Connection timeout...';
        message = 'Please check your internet connection and try again.';
        break;
      case DioErrorType.unknown:
        final List<int> noNetworkConnectionCodes = [7, 101, 111];
        final exception = error.error;
        if (exception is SocketException &&
            noNetworkConnectionCodes.contains(exception.osError?.errorCode)) {
          code = socketErrorCode;
          title = 'No connection found';
          message = 'Please check your internet connection and try again.';
          break;
        }
        title = 'Oh no...';
        message = 'Internal Server Error';
        break;
      case DioErrorType.receiveTimeout:
        title = 'Oh no...';
        message = 'Receive timeout in connection';
        break;
      case DioErrorType.badResponse:
        code = error.response?.statusCode ?? -1;

        if (error.response?.data != null) {
          final data = error.response?.data;

          if (data is String) {
            title = 'Oh no...';
            message = 'Something went wrong. We are working on it.';
            break;
          }

          final String errorMessage = data['message'] ?? '';

          title = 'Something went wrong';
          message = errorMessage.isNotEmpty
              ? errorMessage
              : 'Something went wrong. We are working on it.';
          break;
        }
        title = 'Something went wrong';
        message = 'Something went wrong. Try refreshing the app';
        break;
      case DioErrorType.sendTimeout:
        title = 'Oh no...';
        message = 'Receive timeout in send request';
        break;
      case DioErrorType.badCertificate:
        title = 'This connection is not safe';
        message = 'Please ensure that you are going to correct site';
        break;
      case DioErrorType.connectionError:
        title = 'Connection error...';
        message = 'Please check your internet connection and try again.';
        break;
    }

    return ServerException._(
      errorCode: code,
      errorMessage: message,
      errorTitle: title,
    );
  }
}
