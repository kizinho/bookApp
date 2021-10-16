import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:bookapp/core/controller/get/basic/navigator.dart';
import 'package:bookapp/service/api/api_utils/api_routes.dart';
import 'package:bookapp/view/widget/snackbar/success.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final auth = Get.find<AuthController>();

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
      if (user != null) {
        auth.isAuthenticated.value = true;
        auth.username.value = user.displayName!;
        auth.userId.value = user.uid;
        if (user.photoURL != null)
          auth.photo.value = user.photoURL!;
        else
          auth.photo.value = ApiRoutes.avatar;
      }
      snackBarSuccess('Success!', 'Logging in please wait', true);
      startTimer('/books');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        snackBarWarning('Error!', 'email already taken', false);
        startTimerError('/login');
      }
    }
    return user;
  }
}
