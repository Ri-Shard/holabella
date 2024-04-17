import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holabella/models/base_service_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/models/user_model.dart';

class DataBaseServiceRepository {
  final firestore = FirebaseFirestore.instance;

  Future<dynamic> saveService(User user, List<ServiceModel?> service) async {
    try {
      for (var serv in service) {
        serv!.id = DateTime.now().toString();
        serv.user = user.email;
        await firestore
            .collection('ambassadorhistory')
            .doc(serv.person)
            .set({serv.id!: serv.toJson()}).then((data) {});
      }
    } catch (e) {
      return '-1';
    }
  }

  Future<List<BaseServiceModel?>> getBaseServices() async {
    try {
      return await firestore.collection("services").get().then((data) {
        List<BaseServiceModel?> services = [];
        data.docs.forEach((element) {
          element.data().forEach((key, value) {
            BaseServiceModel service = BaseServiceModel();
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

  Future<List<ServiceModel?>> getHistoryServices() async {
    try {
      return await firestore.collection("ambassadorhistory").get().then((data) {
        List<ServiceModel?> services = [];
        return services;
      });
    } catch (e) {
      return [];
    }
  }
}
