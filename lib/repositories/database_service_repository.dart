import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/models/user_model.dart';

class DataBaseServiceRepository {
  final firestore = FirebaseFirestore.instance;

  // Future<dynamic> saveService(User user) async {
  //   try {
  //     final lo = await firestore
  //         .collection('users')
  //         .doc(user.email)
  //         .set(user.toJson())
  //         .then((data) {});
  //     print("Data saved");
  //   } catch (e) {
  //     return '-1';
  //   }
  // }

  Future<List<ServiceModel?>> getBaseServices() async {
    try {
      return await firestore
          .collection("services")
          .doc('BaseServices')
          .get()
          .then((data) {
        List<ServiceModel?> services = [];
        data.data()!.forEach((key, value) {
          value.forEach((e) {
            ServiceModel service = ServiceModel();
            service.name = e['name'];
            service.category = key;
            service.price = e['price'];
            List<String> ambassador = [];
            e['ambassador'].forEach((am) {
              ambassador.add(am);
            });
            service.ambassador = ambassador;

            services.add(service);
          });
        });
        return services;
      });
    } catch (e) {
      return [];
    }
  }
}
