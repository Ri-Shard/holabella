import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holabella/models/user_model.dart';

class DataBaseRepository {
  final firestore = FirebaseFirestore.instance;

  Future<dynamic> saveUser(User user) async {
    try {
      final lo = await firestore
          .collection('users')
          .doc(user.email)
          .set(user.toJson())
          .then((data) {});
      print("Data saved");
    } catch (e) {
      return '-1';
    }
  }

  Future<User?> verifyUser(String email) async {
    try {
      return await firestore.collection("users").doc(email).get().then((data) {
        return data.data() != null ? User.fromJson(data.data()!) : null;
      });
    } catch (e) {
      return null;
    }
  }
}
