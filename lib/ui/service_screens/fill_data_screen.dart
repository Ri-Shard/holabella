import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/user_model.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_drawer.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/service_screens/controller/service_controller.dart';
import 'package:sizer/sizer.dart';

class FillDataScreen extends StatefulWidget {
  const FillDataScreen({super.key});

  @override
  State<FillDataScreen> createState() => _FillDataScreenState();
}

class _FillDataScreenState extends State<FillDataScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    email.text = authController.authInstance.currentUser!.email!;
    final serviceController = Get.find<ServiceController>();

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurDatos.png',
          fit: BoxFit.fill,
        ),
        Scaffold(
            drawer: CustomDrawer(),
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
            body: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Datos',
                        style: MyTheme.basicTextStyle(
                            color: MyTheme.ocreOscuro,
                            size: 24,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'A continuación por favor rellene el formulario con sus detalles para proceder con el pago del servicio.',
                        style: MyTheme.basicTextStyle(
                            size: 14,
                            fontWeight: FontWeight.normal,
                            color: MyTheme.ocreBase),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Form(
                        key: _key,
                        child: GetBuilder(
                            id: 'dataview',
                            init: Get.find<ServiceController>(),
                            builder: (_) {
                              return Column(
                                children: [
                                  CustomText(
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return 'Campo vacio, ingrese el nombre';
                                      }
                                    },
                                    onChanged: (text) {
                                      _.update(['dataview']);
                                    },
                                    controller: name,
                                    labeltext: 'Nombres',
                                    prefix: const Icon(Icons.person_outline),
                                    suffix: InkWell(
                                      child: Icon(Icons.cancel_outlined),
                                      onTap: () {
                                        name.clear();
                                        _.update(['dataview']);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  CustomText(
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return 'Campo vacio, ingrese el telefono';
                                      }
                                    },
                                    onChanged: (text) {
                                      _.update(['dataview']);
                                    },
                                    controller: phone,
                                    labeltext: 'Telefono',
                                    inputType: TextInputType.phone,
                                    prefix: const Icon(Icons.phone_android),
                                    suffix: InkWell(
                                      child: const Icon(Icons.cancel_outlined),
                                      onTap: () {
                                        phone.clear();
                                        _.update(['dataview']);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  CustomText(
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return 'Campo vacio, ingrese el correo';
                                      }
                                    },
                                    onChanged: (text) {
                                      _.update(['dataview']);
                                    },
                                    controller: email,
                                    inputType: TextInputType.emailAddress,
                                    labeltext: 'Correo',
                                    prefix: const Icon(Icons.mail_outline),
                                    suffix: InkWell(
                                      child: const Icon(Icons.cancel_outlined),
                                      onTap: () {
                                        email.clear();
                                        _.update(['dataview']);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  CustomText(
                                    onChanged: (text) {
                                      _.update(['dataview']);
                                    },
                                    controller: notes,
                                    labeltext: 'Notas',
                                    maxlines: 4,
                                    border: 20,
                                    suffix: InkWell(
                                      child: const Icon(Icons.cancel_outlined),
                                      onTap: () {
                                        notes.clear();
                                        _.update(['dataview']);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 10.w,
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: SvgPicture.asset('assets/svg/Arrow.svg'),
                              ),
                            ),
                            Text(
                              '   ANTERIOR',
                              style: MyTheme.basicTextStyle(
                                  color: MyTheme.ocreBase,
                                  size: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            User user = User();
                            user.email = email.text;
                            user.name = name.text;
                            user.phone = phone.text;
                            serviceController.serviceUser = user;
                            Get.toNamed('/servicepay');
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              'SIGUIENTE   ',
                              style: MyTheme.basicTextStyle(
                                  color: MyTheme.ocreBase,
                                  size: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(
                                width: 10.w,
                                child: SvgPicture.asset('assets/svg/Arrow.svg'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar()),
      ],
    );
  }
}
