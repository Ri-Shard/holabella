import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/address_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/drawer/controller/address_controller.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_listtile.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController ciudad = TextEditingController();
    final TextEditingController tipodevia = TextEditingController();
    final TextEditingController nrovia = TextEditingController();
    final TextEditingController nrovia2 = TextEditingController();
    final TextEditingController nroviacasa = TextEditingController();
    final TextEditingController barrio = TextEditingController();
    final TextEditingController detalles = TextEditingController();
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
              icon: Icon(
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
                    'Editar dirección',
                    style: MyTheme.basicTextStyle(
                        size: 24,
                        fontWeight: FontWeight.normal,
                        color: MyTheme.ocreOscuro),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GetBuilder(
                      id: 'addressview',
                      init: Get.find<AddressController>(),
                      builder: (_) {
                        return Column(
                          children: [
                            CustomText(
                              prefix: Icon(Icons.place_outlined),
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'Campo vacio, ingrese el nombre de la dirección';
                                }
                              },
                              onChanged: (text) {
                                _.update(['addressview']);
                              },
                              controller: name,
                              labeltext: 'Número dirección * ',
                              suffix: InkWell(
                                child: const Icon(Icons.cancel_outlined),
                                onTap: () {
                                  name.clear();
                                  _.update(['addressview']);
                                },
                              ),
                            ),
                            SizedBox(height: 3.h),
                            const CustomSelect(
                              items: ['Valledupar'],
                              title: 'Ciudad',
                              prefix: Icon(Icons.map_outlined),
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: const CustomSelect(
                                      items: [
                                        'Calle',
                                        'Carrera',
                                        'Avenida',
                                        'Diagonal'
                                      ],
                                      title: 'Tipo de via',
                                      prefix: Icon(Icons.filter_list_rounded),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: CustomText(
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return 'Campo vacio, ingrese número de vía';
                                        }
                                      },
                                      onChanged: (text) {
                                        _.update(['addressview']);
                                      },
                                      controller: nrovia,
                                      inputType: TextInputType.number,
                                      labeltext: 'No. de vía',
                                      prefix: Icon(Icons.add_road_outlined),
                                    ),
                                  ),
                                ),
                              ],
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
                                          return 'Campo vacio, ingrese número de vía';
                                        }
                                      },
                                      onChanged: (text) {
                                        _.update(['addressview']);
                                      },
                                      controller: nrovia2,
                                      inputType: TextInputType.number,
                                      labeltext: 'No. de vía',
                                      prefix: Icon(Icons.numbers),
                                    ),
                                  ),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(fontSize: 50),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: CustomText(
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return 'Campo vacio, ingrese número de casa';
                                        }
                                      },
                                      onChanged: (text) {
                                        _.update(['addressview']);
                                      },
                                      controller: nroviacasa,
                                      inputType: TextInputType.number,
                                      labeltext: 'No. de casa',
                                      prefix: Icon(Icons.home_outlined),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            CustomText(
                              onChanged: (text) {
                                _.update(['addressview']);
                              },
                              controller: barrio,
                              labeltext: 'Barrio',
                              inputType: TextInputType.text,
                              prefix: Icon(Icons.home_work_outlined),
                            ),
                            SizedBox(height: 3.h),
                            CustomText(
                              onChanged: (text) {
                                _.update(['addressview']);
                              },
                              controller: detalles,
                              labeltext:
                                  'Detalles de la casa, edificio u oficina',
                              inputType: TextInputType.text,
                              maxlines: 2,
                              border: 20,
                            ),
                          ],
                        );
                      }),
                  Spacer(),
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
                          Get.to('/draweraddaddress');
                        },
                        child: Text(
                          'ACTUALIZAR',
                          style: MyTheme.basicTextStyle(
                              color: MyTheme.verdeMenta,
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
