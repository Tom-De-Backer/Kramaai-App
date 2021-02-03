import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kramaai/screens/authenticate/welcome_screen.dart';
import 'package:kramaai/screens/home/navigation_bar.dart';
import 'package:kramaai/services/activity_notifier.dart';
import 'package:kramaai/services/auth_api.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:kramaai/services/post_notifier.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
      ChangeNotifierProvider(
        create: (context) => PostNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
//        _showItemDialog(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
//        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
//        _navigateToItemDetail(message);
      },
    );

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
