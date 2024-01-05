import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          actions: const [
            Icon(
              Icons.shopping_basket_outlined,
              color: Colors.white,
            ),
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
                'Perfil ',
                style: MyTheme.basicTextStyle(
                    size: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: MyTheme.ocreBajo,
                    child: Text(
                      'D',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Diana Gutierrez ',
                    style: MyTheme.basicTextStyle(
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 7.h,
                child: Buttons(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.handshake_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Contrataciones',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  ontap: () {
                    Get.toNamed('/drawerhiring');
                  },
                  borderColor: Colors.transparent,
                  // focuscolor: MyTheme.verdeMenta,
                  splashColor: MyTheme.verdeMenta,
                  // hovercolor: MyTheme.verdeMenta,
                  // highlightColor: MyTheme.verdeMenta,
                ),
              ),
              SizedBox(
                height: 7.h,
                child: Buttons(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Historial de servicios',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  ontap: () {
                    Get.toNamed('/drawerhistory');
                  },
                  borderColor: Colors.transparent,
                  // focuscolor: MyTheme.verdeMenta,
                  splashColor: MyTheme.verdeMenta,
                  // hovercolor: MyTheme.verdeMenta,
                  // highlightColor: MyTheme.verdeMenta,
                ),
              ),
              SizedBox(
                height: 7.h,
                child: Buttons(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Mis direcciones',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  ontap: () {},
                  borderColor: Colors.transparent,
                  // focuscolor: MyTheme.verdeMenta,
                  splashColor: MyTheme.verdeMenta,
                  // hovercolor: MyTheme.verdeMenta,
                  // highlightColor: MyTheme.verdeMenta,
                ),
              ),
              SizedBox(
                height: 7.h,
                child: Buttons(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Métodos de pago',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  ontap: () {},
                  borderColor: Colors.transparent,
                  // focuscolor: MyTheme.verdeMenta,
                  splashColor: MyTheme.verdeMenta,
                  // hovercolor: MyTheme.verdeMenta,
                  // highlightColor: MyTheme.verdeMenta,
                ),
              ),
              Divider(
                color: MyTheme.dividerpink,
              ),
              SizedBox(
                height: 7.h,
                child: Buttons(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Centro de ayuda',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  ontap: () {},
                  borderColor: Colors.transparent,
                  // focuscolor: MyTheme.verdeMenta,
                  splashColor: MyTheme.verdeMenta,
                  // hovercolor: MyTheme.verdeMenta,
                  // highlightColor: MyTheme.verdeMenta,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 7.h,
                child: Buttons(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: MyTheme.verdeMenta,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Cerrar sesión',
                        style: TextStyle(color: MyTheme.verdeMenta),
                      )
                    ],
                  ),
                  ontap: () {},
                  borderColor: Colors.transparent,
                  // focuscolor: MyTheme.verdeMenta,
                  splashColor: MyTheme.verdeMenta,
                  // hovercolor: MyTheme.verdeMenta,
                  // highlightColor: MyTheme.verdeMenta,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
