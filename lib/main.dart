import 'package:flutter/material.dart';
import 'package:kramaai/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kramaai/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/kramaai_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(MultiProvider(providers: [],)));
}

class MyApp extends StatelessWidget {
  MyApp(MultiProvider multiProvider);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<KramaaiUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper()
      ),
    );
  }
}
