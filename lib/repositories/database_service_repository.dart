import 'package:holabella/models/base_service_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:holabella/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

class DataBaseServiceRepository {
  final firestore = fire.FirebaseFirestore.instance;
  final supabase = supa.Supabase.instance.client;

  // Future<dynamic> saveService(User user, List<ServiceModel?> service) async {
  //   try {
  //     for (var serv in service) {
  //       serv!.id = user.email!.split('@').first +
  //           serv.ambassador!
  //               .split('@')
  //               .first; //TODO correo split @ +correo split @ + hora servicio
  //       serv.user = user.email;
  //       await Future.delayed(const Duration(milliseconds: 500));
  //       await firestore
  //           .collection('ambassadorhistory')
  //           .doc(serv.ambassador)
  //           .set({serv.id!: serv.toJson()}, SetOptions(merge: true)).then(
  //               (data) {});
  //       await firestore.collection('usershistory').doc(serv.user).set(
  //           {serv.id!: serv.toJson()}, SetOptions(merge: true)).then((data) {});
  //     }
  //   } catch (e) {
  //     return '-1';
  //   }
  // }

  Future<List<BaseServiceModel?>> getBaseServices() async {
    try {
      return await supabase.from('base_services').select().then((data) {
        List<BaseServiceModel?> services = [];
        data.forEach((element) {
          print(element);
          BaseServiceModel service = BaseServiceModel();
          service.name = element['name'];
          service.category = element['category'];
          service.price = element['price'].toString();
          service.ambassador = element['ambassador_list'].toString().split(',');
          services.add(service);
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
