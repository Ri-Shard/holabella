import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:holabella/repositories/database_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user_model.dart';

class AuthController extends GetxController {
  final authInstance = auth.FirebaseAuth.instance;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    verifyUser();
  }

  Future<String?> signInMail(String email, String password) async {
    try {
      final response = await authInstance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user?.email);
      if (response != null) {
        Get.offAllNamed('/home');
      }
      return response;
    } catch (e) {}
  }

  Future<String?> signUpMail(String email, String password, User user) async {
    final response = await authInstance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user?.email);

    if (response != null) {
      await saveUser(user);
    }
  }

  saveUser(User user) async {
    await DataBaseRepository().saveUser(user);
    Get.offAllNamed('/home');
  }

  Future<String?> signInWithGoogle() async {
    String? response;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      response =
          (await authInstance.signInWithCredential(credential)).user?.email;
      if (response != null) {
        Get.offAllNamed('/register');
      }
    } catch (e) {
      response = e.toString();
      Get.back();
    }
    return response;
  }

  verifyUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final localUser = authInstance.currentUser;
    if (localUser != null) {
      final response = await DataBaseRepository().verifyUser(localUser.email!);
      if (response != null) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/register',
            arguments: localUser.providerData.first.providerId);
      }
    } else {
      Get.offAllNamed('/loginbase');
    }
  }
}
