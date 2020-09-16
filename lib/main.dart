import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kramaai/screens/authenticate/welcome_screen.dart';
import 'package:kramaai/screens/home/navigation_bar.dart';
import 'package:kramaai/services/activity_notifier.dart';
import 'package:kramaai/services/auth_api.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ActivityNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    checkExistingUser(authNotifier);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scouts Kramaai Mollem',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kSecondaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? NavigationBar() : WelcomeScreen();
        },
      ),
    );
  }
}
