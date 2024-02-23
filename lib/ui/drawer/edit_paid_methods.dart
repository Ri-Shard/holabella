import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/address_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/drawer/controller/paid_controller.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_listtile.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class EditPaidMethodsScreen extends StatelessWidget {
  const EditPaidMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardnumber = TextEditingController();
    final TextEditingController month = TextEditingController();
    final TextEditingController year = TextEditingController();
    final TextEditingController cvv = TextEditingController();

    return SizedBox(
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: MyTheme.verdeMenta,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_basket_outlined,
                color: MyTheme.ocreOscuro,
              ),
            )
          ],
          title: Padding(
            padding: const EdgeInsets.all(60.0),
            child: SvgPicture.asset('assets/svg/LogoOcreClaro.svg'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Editar método de pago',
                    style: MyTheme.basicTextStyle(
                        size: 24,
                        fontWeight: FontWeight.normal,
                        color: MyTheme.ocreOscuro),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Image.asset('assets/images/CardStack.png'),
                  SizedBox(
                    height: 2.h,
                  ),
                  GetBuilder(
                      id: 'paidview',
                      init: Get.find<PaidController>(),
                      builder: (_) {
                        return Column(
                          children: [
                            CustomText(
                                prefix: const Icon(Icons.credit_card),
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return 'Campo vacio, ingrese el nombre de la dirección';
                                  }
                                },
                                onChanged: (text) {
                                  _.update(['paidview']);
                                },
                                controller: cardnumber,
                                inputType: TextInputType.number,
                                labeltext: 'Número de tarjeta * ',
                                suffix: const Icon(Icons.dialpad)),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: CustomSelect(
                                      items: [
                                        '01',
                                        '02',
                                        '03',
                                        '04',
                                        '05',
                                        '06',
                                        '07',
                                        '08',
                                        '09',
                                        '10',
                                        '11',
                                        '12'
                                      ],
                                      title: 'Mes *',
                                    ),
                                  ),
                                ),
                                const Text(
                                  '/',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: CustomSelect(
                                      items: ['Valledupar'],
                                      title: 'Año *',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: CustomText(
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'Campo vacio, ingrese el CVV';
                                          }
                                        },
                                        onChanged: (text) {
                                          _.update(['paidview']);
                                        },
                                        controller: cvv,
                                        inputType: TextInputType.number,
                                        labeltext: 'Número de tarjeta * ',
                                        suffix: const Icon(Icons.dialpad)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Recuerda que los datos de tus tarjetas son únicos, por seguridad no des el número a otras personas.',
                              style: MyTheme.basicTextStyle(
                                  size: 16,
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.ocreOscuro),
                            ),
                          ],
                        );
                      }),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'CANCELAR',
                          style: MyTheme.basicTextStyle(
                              color: MyTheme.fucsia,
                              size: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Get.to('/draweraddaddress');
                        },
                        child: Text(
                          'AGREGAR',
                          style: MyTheme.basicTextStyle(
                              color: MyTheme.ocreOscuro,
                              size: 25,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
