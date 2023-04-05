import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth /**/ {
  final _fireBaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential _userCredential =
        await _fireBaseAuth.signInWithCredential(credential);
    return _userCredential.user;
  }

  Future<User?> signInAnon() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user;
  }

  Future<User?> createUserWithEmailandPassword(
      String email, String password) async {
    final usercrediantal = await _fireBaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return usercrediantal.user;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _fireBaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User?> signInUserWithEmailandPassword(
      String email, String password) async {
    final usercrediantal = await _fireBaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return usercrediantal.user;
  }

  Future<void> logOutAnon() async {
    await _fireBaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  Stream<User?> authStatus() {
    return _fireBaseAuth.authStateChanges();
  }
}
