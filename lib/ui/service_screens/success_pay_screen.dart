import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class SuccessPayScreen extends StatefulWidget {
  const SuccessPayScreen({super.key});

  @override
  State<SuccessPayScreen> createState() => _SuccessPayScreenState();
}

class _SuccessPayScreenState extends State<SuccessPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurSuccessPay.png',
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
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: 50.w,
                  height: 50.w,
                  child: Stack(children: [
                    Image.asset(
                      'assets/images/circlebackground.png',
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/silla.png',
                          colorBlendMode: BlendMode.overlay,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Text('Pago \n Aceptado',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontFamily: 'MoonDream',
                                  fontSize: 25,
                                  color: Colors.white)
                              // MyTheme.basicTextStyle(
                              //     size: 35, fontWeight: FontWeight.w400),
                              ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Text(
                  'Excelente!',
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
                    'Tu pago ha sido exitoso, revisa tu correo para obtener más información sobre tu agenda y tus servicios.',
                    textAlign: TextAlign.center,
                    style: MyTheme.basicTextStyle(
                        color: MyTheme.ocreOscuro,
                        size: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/home');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'FINALIZAR',
                          style: MyTheme.basicTextStyle(
                              color: MyTheme.ocreBase,
                              size: 40,
                              fontWeight: FontWeight.normal),
                        ),
                        Flexible(
                            child: SvgPicture.asset('assets/svg/Arrow.svg'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar()),
      ],
    );
  }
}
