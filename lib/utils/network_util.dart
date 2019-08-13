import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  HttpClient client = new HttpClient();
  final url = "loud-cobra-93.localtunnel.me";
  DefaultHttpClientAdapter dioClient = new DefaultHttpClientAdapter();

  final dio = new Dio((new BaseOptions(
    baseUrl: "https://sharp-cobra-39.localtunnel.me/",
    headers: {
      "Connection": "keep-alive",
    },
  )));

  dioPost(path, queryParameters) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var response;
    try {
      var uri = Uri.https(url, path);
      response = await dio.post(
        uri.toString(),
        queryParameters: queryParameters,
        // onSendProgress: (int sent, int total) {
        //   print("$sent $total");
        // },
      );
      print(response.request);

      dio.interceptors.add(CookieManager(new PersistCookieJar(dir: tempPath)));
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        // dio.interceptors
        //   .add(CookieManager(new PersistCookieJar(dir: "./cookies")));
        dio.interceptors
            .add(CookieManager(new PersistCookieJar(dir: tempPath)));
        response = e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
    return response;
  }

  dioGet(path) async {
    try {
      var uri = Uri.https(url, path);

      var response = await dio.get(uri.toString());
      print(response.request);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return e.response;
    }
  }

  clientpost(path, queryParameters) async {
    var uri = Uri.https(url, path, queryParameters);
    print(uri);

    var request = await client.postUrl(uri);
    var response = await request.close();
    print(response.statusCode);
    return response;
  }

  post(path, queryParameters) async {
    var uri = Uri.https(url, path, queryParameters);

    var response = await http.post(uri, body: queryParameters);

    return response;
  }

  getClient(path) async {
    var uri = Uri.https(url, path);
    var request = await client.getUrl(uri);
    var response = await request.close();
    print(response.statusCode);

    // await for (var contents in response.transform(utf8.decoder)
    //   .transform(json.decoder)
    //   .expand((data) => (data as List))
    //   .map((data) => News.fromJSON(data)))
    return response;
  }

  Future get(path) async {
    var uri = Uri.https(url, path);
    //  uri = Uri.https("jsonplaceholder.typicode.com", "posts");
    var response = await http.get(uri);
    print(response.statusCode);

    return response;
  }
}
