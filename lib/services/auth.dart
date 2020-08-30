import 'package:firebase_auth/firebase_auth.dart';
import 'package:kramaai/models/kramaai_user.dart';


// DEPRECATED!!!!!!!!!!!!!

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on User
  KramaaiUser _kramaaiUserFromFirebaseUser(User user) {
    return user != null ? KramaaiUser(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<KramaaiUser> get user {
    return _auth.authStateChanges()
              // .map((User user) => _kramaaiUserFromFirebaseUser(user));
              // Next line is the same
              .map(_kramaaiUserFromFirebaseUser);
  }

  // Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _kramaaiUserFromFirebaseUser(user);
    } catch(e) {
        print(e.toString());
        return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _kramaaiUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _kramaaiUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
      try{
        return await _auth.signOut();
      } catch(e) {
        print(e.toString());
        return null;
      }
  }
}