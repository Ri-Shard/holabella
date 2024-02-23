import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_listtile.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class ServiceResumeScreen extends StatefulWidget {
  const ServiceResumeScreen({super.key});

  @override
  State<ServiceResumeScreen> createState() => _ServiceResumeScreenState();
}

class _ServiceResumeScreenState extends State<ServiceResumeScreen> {
  List<ServiceModel> services = [
    ServiceModel(
        name: 'Reconstrucción de uña',
        person: 'María Colorida',
        date: 'Lun 17, Ago 2023 - 9:00 am.',
        price: '\$8.000'),
    ServiceModel(
        name: 'Acrygel básico',
        person: 'María Colorida',
        date: 'Lun 17, Ago 2023 - 9:00 am.',
        price: '\$120.000'),
    ServiceModel(
        name: 'Maquillaje',
        person: 'María Colorida',
        date: 'Lun 17, Ago 2023 - 9:00 am.',
        price: '\$135.000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurServiceResume.png',
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
                        'Resumen de servicios',
                        style: MyTheme.basicTextStyle(
                            color: MyTheme.ocreOscuro,
                            size: 24,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Has agendado los siguientes servicios:',
                        style: MyTheme.basicTextStyle(
                            size: 15,
                            fontWeight: FontWeight.normal,
                            color: MyTheme.ocreBase),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                CustomListTile(
                                  name: services[index].name,
                                  person: services[index].person,
                                  date: services[index].date,
                                  price: services[index].price,
                                  iconbutton: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: MyTheme.ocreBajo,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: MyTheme.ocreBase,
                                )
                              ],
                            );
                          }),
                      SizedBox(
                        height: 16.h,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(fontSize: 15),
                                )),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/selectservice');
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Agregar otro servicio ',
                                      style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            )
                          ],
                        ),
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
                          Get.toNamed('/servicedatos');
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
