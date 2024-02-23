import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/repositories/database_service_repository.dart';

class ServiceController extends GetxController {
  DataBaseServiceRepository database = DataBaseServiceRepository();
  final firestore = FirebaseFirestore.instance;

  List<ServiceModel?> servicesData = [];

  @override
  void onInit() async {
    servicesData = await database.getBaseServices();
    print(servicesData);
    super.onInit();
  }

  Future<dynamic> updata() async {
    try {
      final lo =
          await firestore.collection('services').doc('BaseServices').set({
        "Uñas": [
          {
            "name": "Manicure y Pedicure tradicional",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Manicure Tradicional",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Pedicure Tradicional",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Manicure y Pedicure tradicional - Kids",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Manicure tradicional - Kids",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Pedicure tradicional - Kids",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Manicure y Pedicure tradicional - Hombre",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Manicure Tradicional - Hombre",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Pedicure Tradicional - Hombre",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Cambio de esmalte",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Decoracion por uña",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          }
        ],
        "Cepillado": [
          {
            "name": "Blower - Corto",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Blower - Medio",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Blower - Largo",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Mas planchado",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Mas hidratacion",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          }
        ],
        "Cejas y pestañas": [
          {
            "name": "Laminado - Cejas",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Laminado con sombra - Cejas",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          },
          {
            "name": "Laminado - Pestañas",
            "price": "50000",
            "ambassador": ["Doris", "Juliana"]
          }
        ]
      }).then((data) {});
      print("Data saved");
    } catch (e) {
      return '-1';
    }
  }
}
