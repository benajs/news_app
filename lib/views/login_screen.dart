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
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final load_state = false;

  String _email = "";
  String _password = "";
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  Future authenticate(username, password) async {
    Map<String, String> queryParameters = {
      'session[email]': username,
      'session[password]': password,
      "commit": "Sign+in"
    };
    var path = "session";
    // var response = await _netUtil.post(path, queryParameters);
    // print(response.statusCode);
    // if (response.statusCode == 302) {
    print("Logged in");
    //TODO: route navigations
    Navigator.pushNamed(context, '/home');
    //   }
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
        controller: _emailFilter,
        obscureText: false,
        decoration: InputDecoration(
          hintText: "Email",
        ));
    final passwordField = TextField(
        controller: _passwordFilter,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
        ));

    return new Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.7],
              colors: [
                Colors.white,
                Colors.orangeAccent,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                SizedBox(height: 10.0),
                emailField,
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(height: 35.0),
                _buildButtons(),
              ],
            ),
          ),
        ),
      );
  }

  // Swap in between our two forms, registering and logging in
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
      print(response.statusCode);
      print(response.request);
      print(response.body);
    }
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.brown,
                child: new MaterialButton(
                  child: new Text('Login'),
                  onPressed: _loginPressed,
                )),
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

  void _createAccountPressed() {
    createUser(_email, _password);
    print('The user wants to create an accoutn with $_email and $_password');
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
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

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
    authenticate(_email, _password);
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}
