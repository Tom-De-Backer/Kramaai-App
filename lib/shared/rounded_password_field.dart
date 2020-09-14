import 'package:flutter/material.dart';
import 'package:kramaai/shared/text_field_container.dart';

import 'constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSaved;
  final TextEditingController passwordController;
  final TextEditingController passwordControllerConfirm;
  final bool confirm;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.onSaved,
    this.passwordController,
    this.passwordControllerConfirm,
    this.confirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        controller: this.confirm ? this.passwordControllerConfirm : this.passwordController,
        decoration: InputDecoration(
          hintText: "Wachtwoord",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
//          suffixIcon: Icon(
//            Icons.visibility,
//            color: kPrimaryColor,
//          ),
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 20, color: Colors.black),
        validator: (String value) {
          if (!this.confirm) {
            if (value.isEmpty) {
              return 'Wachtwoord is verplicht';
            }

            if (value.length < 6) {
              return 'Wachtwoord is te kort';
            }

            return null;
          } else {
            if (this.passwordController.text != this.passwordControllerConfirm.text) {
              return 'Passwords do not match';
            }
            return null;
          }
        },
      ),
    );
  }
}