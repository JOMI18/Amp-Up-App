import 'package:dio/dio.dart';

import 'package:amp_up/imports.dart';

final dio = Dio();
String? errorMessage;
CustomSharedPreference pref = CustomSharedPreference();

Dio axios() {
  dio.options.baseUrl = "http://10.0.2.2:8000/api/";
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.options.headers['accept'] = 'Application/Json';

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        final token = pref.getString('token') ?? '';
        options.headers['Authorization'] = 'Bearer $token';

        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        String errorMessage;
        switch (e.type) {
          case DioExceptionType.badResponse:
            errorMessage = 'Server error';
            break;
          case DioExceptionType.connectionTimeout:
            errorMessage = 'Connection Timeout';
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = 'Unable to connect to the server';
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = 'Please check your internet connection';
            break;
          case DioExceptionType.unknown:
            errorMessage = 'Something went wrong';
            break;
          default:
            errorMessage = 'An error occurred';
            break;
        }

        DioException customError = DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: errorMessage,
            message: e.message);
        return handler.next(customError);
      },
    ),
  );

  return dio;
}
