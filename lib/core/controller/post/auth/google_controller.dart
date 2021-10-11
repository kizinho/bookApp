import 'package:bookapp/core/controller/get/basic/navigator.dart';
import 'package:bookapp/view/widget/snackbar/success.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleController extends GetxController {

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    User? user;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      user = userCredential.user;
      snackBarSuccess('Success!', 'Logging in please wait', true);
      startTimer('books');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        snackBarWarning('Error!', 'email already taken', false);
        startTimerError('login');
      }
    }
    return user;
  }
}
