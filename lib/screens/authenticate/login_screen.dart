import 'package:flutter/material.dart';
import 'package:kramaai/models/kramaai_user.dart';
import 'package:kramaai/screens/authenticate/background_login.dart';
import 'package:kramaai/screens/authenticate/background_welcome_screen.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:kramaai/services/auth_api.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:kramaai/shared/rounded_button.dart';
import 'package:kramaai/shared/rounded_input_field.dart';
import 'package:kramaai/shared/rounded_password_field.dart';
import 'package:kramaai/shared/text_field_container.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  int mode;
  Login({Key key, this.mode}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordControllerConfirm = new TextEditingController();

  AuthMode _authMode;
  KramaaiUser _user = KramaaiUser();

  @override
  void initState() {
    if (widget.mode == 0){
      _authMode = AuthMode.Signup;
    } else {
      _authMode = AuthMode.Login;
    }
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
      Navigator.pop(context);
    } else {
      signup(_user, authNotifier);
      Navigator.pop(context);
    }
  }

  Widget _buildDisplayNameField() {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: (value) {},
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "DisplayName",
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
        initialValue: 'tom001',
        style: TextStyle(fontSize: 26, color: Colors.black),

        validator: (String value) {
          if (value.isEmpty) {
            return 'Display Name is required';
          }

          if (value.length < 3 || value.length > 15) {
            return 'Display Name must be between 3 and 15 characters';
          }

          return null;
        },
        onSaved: (String value) {
          _user.displayName = value;
        },
      ),
    );
  }

  Widget _buildEmailField() {
    return RoundedInputField(
      hintText: "Email",
      icon: Icons.email,
      onChanged: (value) {},
      onSaved: (String value) {
      _user.email = value;
    },
    );
  }

  Widget _buildPasswordField() {
    return RoundedPasswordField(
      passwordController: _passwordController,
      passwordControllerConfirm: _passwordControllerConfirm,
      onChanged: (value) {},
      confirm: false,
      onSaved: (String value) {
      _user.password = value;
    },
    );
  }

  Widget _buildConfirmPasswordField() {
    return RoundedPasswordField(
      onChanged: (value) {},
      passwordController: _passwordController,
      passwordControllerConfirm: _passwordControllerConfirm,
      confirm: true,
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
                    "Vul uw gegevens in",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Image.asset(
                    "assets/images/logo_scoutsgidsenvl.png",
                    width: size.width * 0.30,
                  ),
                  SizedBox(
                      height: size.height * 0.02
                  ),
                  _authMode == AuthMode.Signup ? _buildDisplayNameField() : Container(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _authMode == AuthMode.Signup ? _buildConfirmPasswordField() : Container(),
                  SizedBox(height: size.height * 0.02),
                  RoundedButton(
                    text: _authMode == AuthMode.Signup ? "Registreer" : "Login",
                    color: kSecondaryColor,
                    press: () {
                      _submitForm();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}