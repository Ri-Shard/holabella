import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/repositories/database_service_repository.dart';

class ServiceController extends GetxController {
  DataBaseServiceRepository database = DataBaseServiceRepository();
  final firestore = FirebaseFirestore.instance;

  List<ServiceModel?> servicesData = [];
  ServiceModel? newService;
  @override
  void onInit() async {
    servicesData = await database.getBaseServices();
    //updata();
    print(servicesData);
    super.onInit();
  }

//   Future<dynamic> updata() async {
//     try {
//       final lo =
//           await firestore.collection('services').doc('Cejas y Pestañas').set({
//         "Laminado - Cejas": {
//           "name": "Laminado - Cejas",
//           "price": 50000,
//           "ambassador": ["Doris", "Juliana"]
//         },
//         "Laminado - Pestañas": {
//           "name": "Laminado - Pestañas",
//           "price": 50000,
//           "ambassador": ["Doris", "Juliana"]
//         },
//         "Laminado con sombra - Cejas": {
//           "name": "Laminado con sombra - Cejas",
//           "price": 50000,
//           "ambassador": ["Doris", "Juliana"]
//         }
//       }).then((data) {});
//       print("Data saved");
//     } catch (e) {
//       return '-1';
//     }
//   }
}

        // {
        //   "name": "Manicure y Pedicure tradicional",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Manicure Tradicional",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Pedicure Tradicional",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Manicure y Pedicure tradicional - Kids",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Manicure tradicional - Kids",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Pedicure tradicional - Kids",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Manicure y Pedicure tradicional - Hombre",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Manicure Tradicional - Hombre",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Pedicure Tradicional - Hombre",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Cambio de esmalte",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // {
        //   "name": "Decoracion por uña",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // }



        // "Blower - Corto": {
        //   "name": "Blower - Corto",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // "Blower - Medio": {
        //   "name": "Blower - Medio",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // "Blower - Largo": {
        //   "name": "Blower - Largo",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // "Mas planchado": {
        //   "name": "Mas planchado",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // },
        // "Mas hidratacion": {
        //   "name": "Mas hidratacion",
        //   "price": "50000",
        //   "ambassador": ["Doris", "Juliana"]
        // }



          //         "Laminado - Cejas": {
          //   "name": "Laminado - Cejas",
          //   "price": 50000,
          //   "ambassador": ["Doris", "Juliana"]
          // },
          // "Laminado - Pestañas": {
          //   "name": "Laminado - Pestañas",
          //   "price": 50000,
          //   "ambassador": ["Doris", "Juliana"]
          // },
          // "Laminado con sombra - Cejas": {
          //   "name": "Laminado con sombra - Cejas",
          //   "price": 50000,
          //   "ambassador": ["Doris", "Juliana"]
          // }