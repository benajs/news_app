import 'package:meta/meta.dart';
import 'package:news_app/utils/network_util.dart';

class User {
  final String username;
  final String password;

  User.fromJSON(Map<String, dynamic> jsonMap)
      : username = jsonMap['username'],
        password = jsonMap['password'];
}
