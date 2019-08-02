import 'dart:convert';
import 'dart:io';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  HttpClient client = new HttpClient();
  final url = "dull-baboon-9.localtunnel.me";

  post(path, queryParameters) async {
    var uri = Uri.https(url, path, queryParameters);
    var request = await client.postUrl(uri);
    var response = await request.close();
    print(response.statusCode);
    return response;
  }

  get(path) async {
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
}
