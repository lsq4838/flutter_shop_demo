// Dio请求工具类

import 'package:dio/dio.dart';
import 'package:shop_demo/constants/index.dart';

class DioRequest {
  final Dio _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = GlobalConstants.timeout
      ..receiveTimeout = GlobalConstants.timeout
      ..sendTimeout = GlobalConstants.timeout;

    // 拦截器
    _setInterceptors();
  }

  void _setInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (request, handler) {
          return handler.next(request);
        },
        // 响应拦截器
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return handler.next(response);
          }
          return handler.reject(
            DioException(requestOptions: response.requestOptions),
          );
        },
        // 错误拦截器
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) {
    return _getResponse(_dio.get(url, queryParameters: queryParameters));
  }

  Future<dynamic> _getResponse(Future<Response> task) async {
    try {
      final response = await task;
      final data = response.data;
      if (data["code"] == GlobalConstants.successCode) {
        return data["result"];
      }

      throw Exception(data["msg"] ?? "请求失败");
    } catch (e) {
      throw Exception(e);
    }
  }
}

final dioRequest = DioRequest();
