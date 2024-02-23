import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/address_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_listtile.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Address> address = [
      Address(name: 'Casa', direccion: 'Carrera 13 # 12 - 57, San Joaquín'),
      Address(name: 'Trabajo', direccion: 'Calle 20a # 18 - 34'),
      Address(name: 'Spa', direccion: 'Carrera 23 # 15 - 28'),
    ];
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Mis direcciones ',
                style: MyTheme.basicTextStyle(
                    size: 24,
                    fontWeight: FontWeight.normal,
                    color: MyTheme.ocreOscuro),
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: address.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        CustomListTile(
                          name: address[index].name,
                          date: address[index].direccion,
                          color: MyTheme.ocreBase,
                          iconbutton: TextButton(
                              onPressed: () {
                                Get.toNamed('/drawereditaddress');
                              },
                              child: Text(
                                'Editar',
                                style: TextStyle(color: MyTheme.ocreBase),
                              )),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: MyTheme.dividerpink,
                        )
                      ],
                    );
                  }),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/draweraddaddress');
                    },
                    child: Text(
                      'AGREGAR DIRECCION',
                      style: MyTheme.basicTextStyle(
                          color: MyTheme.ocreOscuro,
                          size: 20,
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
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
