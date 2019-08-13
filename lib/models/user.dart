class User {
  final String username;
  final String password;

  User.fromJSON(Map<String, dynamic> jsonMap)
      : username = jsonMap['username'],
        password = jsonMap['password'];
}
