// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  //LOGIN EMAIL
  Future<User?> loginWithEmail(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  //REGISTER EMAIL
  Future<User?> registerWithEmail(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;

    if (user != null) {
      await user.sendEmailVerification(); // 🔥 kirim email
    }

    return user;
  }

  //LOGIN GOOGLE
  Future<User?> loginGoogle() async {
    // 1. Trigger proses login Google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null; // User membatalkan login

    // 2. Dapatkan detail autentikasi dari request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // 3. Buat credential baru untuk Firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4. Masuk ke Firebase menggunakan credential tersebut
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!;

        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );

        final userCredential = await _auth.signInWithCredential(credential);

        return userCredential.user;
      } else {
        print("Login gagal: ${result.message}");
        return null;
      }
    } catch (e) {
      print("Error Facebook login: $e");
      return null;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  //VERIFIKASI USER
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    await user?.reload();

    return user?.emailVerified ?? false;
  }
}
