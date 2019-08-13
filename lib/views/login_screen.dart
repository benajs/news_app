import 'package:flutter/material.dart';
import 'package:news_app/utils/network_util.dart';

NetworkUtil _netUtil = new NetworkUtil();

enum FormType { login, register }

//User Sign-in /Sign-up Form
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final isLoading = false;
  static String username = "benajs@gmail.com", password = "12345678";
  final emailField = TextField(
    obscureText: false,
    onChanged: (text) {
      username = text;
    },
    decoration: InputDecoration(
      hintText: "Email",
    ),
  );
  final passwordField = TextField(
      obscureText: true,
      onChanged: (text) {
        password = text;
      },
      decoration: InputDecoration(
        hintText: "Password",
      ));

  FormType _form = FormType.login;

  Future authenticate() async {
    Map<String, String> queryParameters = {
      'session[email]': username,
      'session[password]': password,
      "commit": "Sign+in"
    };
    var path = "session";
    var response = await _netUtil.dioPost(path, queryParameters);
    print(response.statusCode);
    if ([302, 200].contains(response.statusCode)) {
      print("Logged in");
      Navigator.pushNamed(context, '/home');
    }

  //  Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            emailField,Padding(padding: EdgeInsets.all(2.0),),
            passwordField,
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(padding: EdgeInsets.all(2.0),
              child: new Text('Login'),
              onPressed: loginPressed,
            ),
            new FlatButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new Material(
                child: RaisedButton(
              child: Text(
                'Create an account',
              ),
              onPressed: _createAccountPressed,
            )),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  Future createUser(username, password) async {
    Map<String, String> queryParameters = {
      'session[email]': username,
      'session[password]': password,
    };
    var path = "user";
    var response = _netUtil.post(path, queryParameters);

    if (response.statusCode == 200) {
      print("User created");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      print(response);
    }
  }

  void _createAccountPressed() {
    createUser(username, password);
    print('The user wants to create an account with $username and $password');
  }

  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  void loginPressed() {
    print('The user wants to login with $username and $password');
    authenticate();
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $username");
  }
}
