import 'package:bookapp/core/controller/get/basic/navigator.dart';
import 'package:bookapp/view/widget/snackbar/error.dart';
import 'package:bookapp/view/widget/snackbar/success.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:math';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleController extends GetxController {
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.app.booksLearningID',
          redirectUri: Uri.parse(
              'https://bookapp-9e439.firebaseapp.com/__/auth/handler')),
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    User? user;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      user = userCredential.user;
      snackBarSuccess('Success!', 'Logging in please wait', true);
      startTimer('books');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        snackBarWarning('Error!', 'email already taken', false);
        startTimerError('login');
      }
    } catch (e) {
      snackBarError('Error!', '$e', false);
    }
    return user;
  }
}
