import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:holabella/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

class DataBaseRepository {
  final firestore = fire.FirebaseFirestore.instance;
  final supabase = supa.Supabase.instance.client;

  Future<dynamic> saveUser(User user) async {
    try {
      return await supabase.from('users').insert(user.toJson());
    } catch (e) {
      return '-1';
    }
  }

  Future<User?> verifyUser(String email) async {
    try {
      return await supabase
          .from('users')
          .select()
          .eq('email', email)
          .then((data) {
        // return await firestore.collection("users").doc(email).get().then((data) {
        return User.fromJson(data[0]);
      });
    } catch (e) {
      return null;
    }
  }
}
