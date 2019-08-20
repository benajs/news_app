class User {
  final String username;
  final String password;
  final String token;

  User.fromJSON(Map<String, dynamic> jsonMap)
      : username = jsonMap['username'],
        password = jsonMap['password'],
        token = jsonMap['token'];
}
