import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:holabella/models/base_service_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/models/user_model.dart';
import 'package:holabella/repositories/database_service_repository.dart';

class ServiceController extends GetxController {
  DataBaseServiceRepository database = DataBaseServiceRepository();
  final firestore = FirebaseFirestore.instance;

  List<BaseServiceModel?> servicesData = [];
  List<ServiceModel?> newServicesData = [];
  ServiceModel? newService;
  User? serviceUser;
  @override
  void onInit() async {
    servicesData = await database.getBaseServices();

    print(servicesData);
    super.onInit();
  }

  saveService(List<ServiceModel?> service) async {
    try {
      await database.saveService(serviceUser!, service);
    } catch (e) {}
  }
}
