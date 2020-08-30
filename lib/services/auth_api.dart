import 'package:kramaai/models/kramaai_user.dart';
import 'auth_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

login(KramaaiUser user, AuthNotifier authNotifier) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (userCredential != null) {
    User firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}


signup(KramaaiUser user, AuthNotifier authNotifier) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (userCredential != null) {
    User firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(displayName: user.displayName);
      await firebaseUser.reload();

      print("Sign up: $firebaseUser");

      User currentUser = FirebaseAuth.instance.currentUser;
      authNotifier.setUser(currentUser);
    }
  }
}



signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  User firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser != null) {
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}
