import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:holabella/repositories/database_repository.dart';

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
    final response = await authInstance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user?.email);
    return response;
  }

  Future<String?> signUpMail(String email, String password, User user) async {
    final response = await authInstance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user?.email);

    if (response != null) {
      DataBaseRepository().saveUser(user);
    }
  }

  verifyUser() async {
    await Future.delayed(Duration(seconds: 2));
    final localUser = authInstance.currentUser;
    if (localUser != null) {
      final response = await DataBaseRepository().verifyUser(localUser.email!);
      if (response != null) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/register');
      }
    } else {
      Get.offAllNamed('/loginbase');
    }
  }
}
