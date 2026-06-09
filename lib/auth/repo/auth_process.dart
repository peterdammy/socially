import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = Provider(
  (ref) => AuthProcess(
    auth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn.instance,
  ),
);

class AuthProcess {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthProcess({required this.auth, required this.googleSignIn});

  Future<void> signInWithGoogle() async {
    await googleSignIn.initialize(
      serverClientId:
          '522123459411-jvgms8fus6gtgq3m1veqrc80jfbbfqkq.apps.googleusercontent.com',
    );

    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    await auth.signInWithCredential(credential);
  }
}
