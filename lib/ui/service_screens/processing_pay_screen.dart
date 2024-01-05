import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/service_screens/service_controller.dart';
import 'package:sizer/sizer.dart';

class ProcessingPayScreen extends StatefulWidget {
  const ProcessingPayScreen({super.key});

  @override
  State<ProcessingPayScreen> createState() => _ProcessingPayScreenState();
}

class _ProcessingPayScreenState extends State<ProcessingPayScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Get.toNamed('/servicesuccesspay'));
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurProcesandoPago.png',
          fit: BoxFit.fill,
        ),
        Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              actions: const [
                SizedBox(
                  width: 16,
                ),
                Icon(Icons.shopping_basket_outlined),
                SizedBox(
                  width: 20,
                )
              ],
              title: Padding(
                padding: const EdgeInsets.all(60.0),
                child: SvgPicture.asset('assets/svg/LogoOcreoscuroyclaro.svg'),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/images/Procesando.png',
                ),
                Text(
                  'Procesando...',
                  style: MyTheme.basicTextStyle(
                      color: MyTheme.ocreOscuro,
                      size: 26,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Text(
                    'Mientras esperas debemos decirte que por dentro también eres hermosa.',
                    textAlign: TextAlign.center,
                    style: MyTheme.basicTextStyle(
                        color: MyTheme.ocreOscuro,
                        size: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar()),
      ],
    );
  }
}
