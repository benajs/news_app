import 'package:meta/meta.dart';
import 'package:news_app/utils/network_util.dart';

class User {
//  final String username;
//  final String password;

// User.fromJSON(Map<String, dynamic> jsonMap) :
// username= jsonMap['username'], 
//     password = jsonMap['password'];
NetworkUtil _netUtil = new NetworkUtil();


Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
     Map<String, String> queryParameters = {
      'user': username,
      'password': password,
    };
    var path = "session";
    var response = await _netUtil.post(path, queryParameters);
   
    return response;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
