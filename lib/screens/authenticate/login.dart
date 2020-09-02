import 'package:flutter/material.dart';
import 'package:kramaai/models/kramaai_user.dart';
import 'package:kramaai/screens/authenticate/background_login.dart';
import 'package:kramaai/screens/authenticate/background_welcome_screen.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:kramaai/services/auth_api.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:kramaai/shared/rounded_button.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  KramaaiUser _user = KramaaiUser();

  @override
  void initState() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      signup(_user, authNotifier);
    }
  }

  Widget _buildDisplayNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Display Name",
        labelStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 26, color: Colors.black),
      cursorColor: Colors.black,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Display Name is required';
        }

        if (value.length < 5 || value.length > 12) {
          return 'Display Name must be between 5 and 12 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.displayName = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black38),
      ),
      keyboardType: TextInputType.emailAddress,
      initialValue: 'tom_debacker',
      style: TextStyle(fontSize: 26, color: Colors.black),
      cursorColor: Colors.black,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.black38),
      ),
      style: TextStyle(fontSize: 26, color: Colors.black),
      cursorColor: Colors.black,
      obscureText: true,
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 5 || value.length > 20) {
        }

        return null;
      },
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(color: Colors.white54),
      ),
      style: TextStyle(fontSize: 26, color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building login screen");
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BackgroundLogin(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(32, 96, 32, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Please Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                  SizedBox(height: 32),
                  _authMode == AuthMode.Signup ? _buildDisplayNameField() : Container(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _authMode == AuthMode.Signup ? _buildConfirmPasswordField() : Container(),
                  SizedBox(height: 32),
//                  ButtonTheme(
//                    minWidth: 200,
//                    child: RaisedButton(
//                      padding: EdgeInsets.all(10.0),
//                      child: Text(
//                        'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                      onPressed: () {
//                        setState(() {
//                          _authMode =_authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
//                        });
//                      },
//                    ),
//                  ),
//                  SizedBox(height: 16),
                  RoundedButton(
                    text: "LOGIN",
                    color: kSecondaryColor,
                    press: () {
                      _submitForm();
                    },
                  ),
//                  ButtonTheme(
//                    minWidth: 200,
//                    child: RaisedButton(
//                      padding: EdgeInsets.all(10.0),
//                      onPressed: () => _submitForm(),
//                      child: Text(
//                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}