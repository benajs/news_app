import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final url = "demo9629643.mockable.io";

  static BaseOptions options = new BaseOptions(
    baseUrl: "http://demo9629643.mockable.io/",
    contentType: ContentType.parse("application/json"),
    headers: {
      "Connection": "keep-alive",
    },
  );
  final dio = new Dio(options);
  SharedPreferences prefs;
  String token_header = "auth";

  dioLogin(path, username, password) async {
    Map<String, String> queryParameters = {
      'session[email]': username,
      'session[password]': password,
      "commit": "Sign+in"
    };
    var response;
    try {
      var uri = Uri.https(url, path);
      response = await dio.post(
        uri.toString(),
        queryParameters: queryParameters,
      );
      //  options.headers.addAll(response.headers);
      print(response.request);
      var cookie = response.headers["set-cookie"].toString(),
          token = cookie.toString().split(";")[0].split("=").last;
      prefs = await SharedPreferences.getInstance();
      await prefs.setString(token_header, token.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        response = e.response;
      } else {
        print(e.request);
        print(e.message);
      }
    }
    return response;
  }

  dioPost(path, queryParameters) async {
    var response;
    try {
      var uri = Uri.https(url, path);

      String token = await prefs.getString(token_header);

      response = await dio.post(
        uri.toString(),
        queryParameters: queryParameters,
        options: Options(
            connectTimeout: 50000,
            receiveTimeout: 3000,
            headers: {token_header: token}),
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
      );
      print(response.request);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        response = e.response;
      } else {
        print(e.request);
        print(e.message);
      }
    }
    return response;
  }

  dioGet(path) async {
    try {
      String token = await prefs.getString(token_header);

      var uri = Uri.https(url, path);
      var response = await dio.get(
        uri.toString(),
        options: Options(
            connectTimeout: 50000,
            receiveTimeout: 3000,
            headers: {token_header: token}),
      );
      print(response.request);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
      return e.response;
    }
  }
}
