import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holabella/ui/auth/login_base_screen.dart';
import 'package:holabella/ui/auth/login_screen.dart';
import 'package:holabella/ui/auth/register_screen.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyTheme.ocreOscuro),
          useMaterial3: true,
        ),
        home: RegisterScreen());
  }
}
