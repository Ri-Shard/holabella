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

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController cardnumber = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurPago.png',
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
                        'Pago',
                        style: MyTheme.basicTextStyle(
                            color: MyTheme.ocreOscuro,
                            size: 24,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: MyTheme.basicTextStyle(
                                color: MyTheme.ocreBase, size: 16),
                          ),
                          Text(
                            '\$263.000',
                            style: MyTheme.basicTextStyle(
                                color: MyTheme.ocreBase, size: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Selecciona el método de pago preferido.',
                        style: MyTheme.basicTextStyle(
                            size: 14,
                            fontWeight: FontWeight.normal,
                            color: MyTheme.ocreBase),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GetBuilder(
                          id: 'payview',
                          init: Get.find<ServiceController>(),
                          builder: (_) {
                            return Column(
                              children: [
                                const CustomSelect(
                                  items: ['Tarjeta de credito', 'PSE'],
                                  title: 'Metodo de pago *',
                                  prefix: Icon(Icons.filter_list_rounded),
                                ),
                                SizedBox(height: 3.h),
                                CustomText(
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'Campo vacio, ingrese el numero de la tarjeta';
                                    }
                                  },
                                  onChanged: (text) {
                                    _.update(['payview']);
                                  },
                                  controller: cardnumber,
                                  labeltext: 'Número de la tarjeta * ',
                                  inputType: TextInputType.number,
                                  suffix: InkWell(
                                    child: const Icon(Icons.cancel_outlined),
                                    onTap: () {
                                      cardnumber.clear();
                                      _.update(['payview']);
                                    },
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: CustomText(
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return 'Campo vacio, ingrese fecha de vencimiento';
                                            }
                                          },
                                          onChanged: (text) {
                                            _.update(['payview']);
                                          },
                                          controller: date,
                                          inputType: TextInputType.number,
                                          labeltext: 'Vence el *',
                                          hint: 'mm / yyyy',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: CustomText(
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return 'Campo vacio, ingrese el código de verificación';
                                            }
                                          },
                                          onChanged: (text) {
                                            _.update(['payview']);
                                          },
                                          controller: date,
                                          inputType: TextInputType.number,
                                          labeltext: 'CCV *',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: const CustomSelect(
                                          items: ['1', '2', '3', '12'],
                                          title: 'Cuotas *',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: const CustomSelect(
                                          prefix:
                                              Icon(Icons.filter_list_rounded),
                                          items: ['CC', 'CE'],
                                          title: 'Tipo documento *',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: CustomText(
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return 'Campo vacio, ingrese fecha de vencimiento';
                                            }
                                          },
                                          onChanged: (text) {
                                            _.update(['payview']);
                                          },
                                          controller: date,
                                          inputType: TextInputType.number,
                                          labeltext: 'No. de documento *',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                CustomText(
                                  onChanged: (text) {
                                    _.update(['payview']);
                                  },
                                  controller: cardnumber,
                                  labeltext: 'Número de cupón ',
                                  inputType: TextInputType.number,
                                  prefix: Icon(Icons.local_activity_outlined),
                                ),
                              ],
                            );
                          })
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
                          Get.toNamed('/serviceprocesingpay');
                        },
                        child: Row(
                          children: [
                            Text(
                              'PAGAR   ',
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
