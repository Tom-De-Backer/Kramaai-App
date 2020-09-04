import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/shared/text_field_container.dart';

import 'constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSaved;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
        initialValue: 'tom_debacker@msn.com',
        style: TextStyle(fontSize: 26, color: Colors.black),
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
      ),
    );
  }
}