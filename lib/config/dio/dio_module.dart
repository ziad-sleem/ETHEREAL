import 'package:dio/dio.dart';
import 'package:e_commerce/features/authentication/data/datasources/auth_local_data_source_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../core/utils/end_points.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(AuthLocalDataSourceContract authLocalDataSource) {
    final dio = Dio();

    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    // Using Logger for pretty logging since pretty_dio_logger is not in pubspec
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 75,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i("REQUEST[${options.method}] => PATH: ${options.path}");
          logger.d("Data: ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i(
            "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}",
          );
          logger.d("Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.e(
            "ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}",
          );
          logger.e("Message: ${e.message}");
          logger.e("Response Data: ${e.response?.data}");
          return handler.next(e);
        },
      ),
    );

    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await authLocalDataSource.getToken();

          if (token != null) {
            options.headers['token'] = token;
          }

          handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
