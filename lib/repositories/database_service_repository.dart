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
      return await firestore.collection("services").get().then((data) {
        List<ServiceModel?> services = [];
        data.docs.forEach((element) {
          element.data().forEach((key, value) {
            ServiceModel service = ServiceModel();
            service.name = value['name'];
            service.category = element.id;
            service.price = value['price'].toString();
            List<String> ambassador = [];
            value['ambassador'].forEach((am) {
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
