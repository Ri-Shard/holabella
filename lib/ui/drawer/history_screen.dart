import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_listtile.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    return SizedBox(
      width: double.infinity,
      child: Scaffold(
        backgroundColor: MyTheme.purpura,
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
                color: Colors.white,
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
                'Historial de servicios ',
                style: MyTheme.basicTextStyle(
                    size: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
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
                          color: Colors.white,
                        ),
                        Divider(
                          thickness: 0.5,
                          color: MyTheme.dividerpink,
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
