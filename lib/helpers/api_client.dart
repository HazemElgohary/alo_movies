import 'package:dio/dio.dart';


class ApiClient {
  final Dio dio;

  ApiClient(this.dio);


  /// sends a [GET] request to the given [url]
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    final res = await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          // if (attachToken) HttpHeaders.authorizationHeader: Auth.bearerToken,
          // 'accept-lang': Lang.current.languageCode,
          ...headers,
        },
      ),
    );
    return res;
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.post(
      path,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {
          // if (attachToken) HttpHeaders.authorizationHeader: Auth.bearerToken,
          // 'accept-lang': Lang.current.languageCode,
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return res;
  }

  Future<Response> put(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    final res = await dio.put(
      path,
      data: body,
      queryParameters: query,
      options: Options(headers: {
        // HttpHeaders.authorizationHeader: Auth.bearerToken,
        // 'accept-lang': Lang.current.languageCode,
        ...headers,
      }),
    );
    return res;
  }

  Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    final res = await dio.delete(
      path,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {
          // HttpHeaders.authorizationHeader: Auth.bearerToken,
          // 'accept-lang': Lang.current.languageCode,
          ...headers,
        },
      ),
    );
    return res;
  }
}
