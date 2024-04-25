import 'package:holabella/models/base_service_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:holabella/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

class DataBaseServiceRepository {
  final firestore = fire.FirebaseFirestore.instance;
  final supabase = supa.Supabase.instance.client;

  Future<dynamic> saveService(User user, List<ServiceModel?> service) async {
    try {
      for (var serv in service) {
        serv!.id_service = -1;
        serv.user_email = user.email;
        await Future.delayed(const Duration(milliseconds: 500));

        final response =
            await supabase.from('ambassador_history').insert(serv.toJson());
        print(response);
      }
    } catch (e) {
      return '-1';
    }
  }

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

  // Future<List<ServiceModel?>> getHistoryServices() async {
  //   try {
  //     return await firestore.collection("ambassadorhistory").get().then((data) {
  //       List<ServiceModel?> services = [];
  //       return services;
  //     });
  //   } catch (e) {
  //     return [];
  //   }
  // }

  Stream getAmbassadorServices(String ambassador_email, String date) {
    return supabase
        .from('ambassador_history')
        .select('hour')
        .eq('ambassador', ambassador_email)
        .eq('date', date)
        .asStream();
  }
}
