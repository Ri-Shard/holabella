import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authInstance = FirebaseAuth.instance;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<String?> signInMail(String email, String password) async {
    final response = await authInstance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user?.email);
    return response;
  }

  Future<String?> signUpMail(String email, String password) async {
    return await authInstance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user?.email);
  }
}
