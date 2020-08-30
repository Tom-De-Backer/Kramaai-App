import 'package:flutter/material.dart';
import 'package:kramaai/models/kramaai_user.dart';
import 'package:kramaai/screens/authenticate/authenticate.dart';
import 'package:kramaai/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<KramaaiUser>(context);

    // Return either Home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
