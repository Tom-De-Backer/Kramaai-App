import 'package:flutter/material.dart';
import 'package:kramaai/services/auth_api.dart';
import 'package:kramaai/shared/rounded_button.dart';

import 'package:kramaai/services/auth_notifier.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    return Scaffold(
      body: Center(
        child: RoundedButton(
          text: 'Log uit',
          press: () => signout(authNotifier),
        ),
      )
    );
  }
}
