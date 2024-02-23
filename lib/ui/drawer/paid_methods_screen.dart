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

class PaidMethodsScreen extends StatelessWidget {
  const PaidMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Métodos de pago',
                style: MyTheme.basicTextStyle(
                    size: 24,
                    fontWeight: FontWeight.normal,
                    color: MyTheme.ocreOscuro),
              ),
              SizedBox(
                height: 7.h,
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed('/drawereditpaidmethods');
                  },
                  child: Image.asset('assets/images/List.png')),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/draweraddpaidmethods');
                    },
                    child: Text(
                      'AGREGAR MÉTODO DE PAGO',
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
