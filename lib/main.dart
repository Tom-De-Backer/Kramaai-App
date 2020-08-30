import 'package:flutter/material.dart';
import 'package:kramaai/screens/authenticate/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kramaai/screens/feed.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:provider/provider.dart';
import 'models/kramaai_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? Feed() : Login();
        },
      ),
    );
  }
}
