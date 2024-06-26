import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/auth/login_base_screen.dart';
import 'package:holabella/ui/auth/login_screen.dart';
import 'package:holabella/ui/auth/register_screen.dart';
import 'package:holabella/ui/drawer/controller/address_controller.dart';
import 'package:holabella/ui/drawer/controller/paid_controller.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/routes.dart';
import 'package:holabella/ui/service_screens/controller/service_controller.dart';
import 'package:holabella/ui/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://pbzeqpdyjxmpqztgsnqw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBiemVxcGR5anhtcHF6dGdzbnF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM4OTYyMzYsImV4cCI6MjAyOTQ3MjIzNn0.h8EgL8mBenCM5d9jKzO9DAsBYpxswhasQe-Wt__OdJc',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;

    Get.put(AuthController());
    Get.put(ServiceController());
    Get.put(AddressController());
    Get.put(PaidController());

    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        localizationsDelegates: localization.localizationsDelegates,
        supportedLocales: const [Locale('es')],
        debugShowCheckedModeBanner: false,
        title: 'HolaBella',
        getPages: appRoutes(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyTheme.ocreOscuro),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
      );
    });
  }
}
