import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  HttpClient client = new HttpClient();
  final url = "breezy-dragonfly-8.localtunnel.me";
  Dio dio = new Dio();

  dioPost(path, queryParameters) async {
    var uri = Uri.https(url, path);
    print(queryParameters);
    print(uri);
    dio.options.baseUrl = url;

    var response = await dio.post(
      path,
      data: queryParameters,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    );
    print(response.request);
    return response;
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

  get_client(path) async {
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

  get(path) async {
    var uri = Uri.https(url, path);
    uri = Uri.https("jsonplaceholder.typicode.com", "posts");
    var response = await http.get(uri);
    print(response.statusCode);

    return response;
  }
}
