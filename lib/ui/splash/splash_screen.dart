import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/my_theme.dart';

import '../auth/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return GetBuilder(
        id: 'splashView',
        init: authController,
        builder: (context) {
          return Scaffold(
            backgroundColor: MyTheme.ocreOscuro,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.maxFinite,
                ),
                SvgPicture.asset('assets/svg/LogoBlanco.svg')
              ],
            ),
          );
        });
  }
}
