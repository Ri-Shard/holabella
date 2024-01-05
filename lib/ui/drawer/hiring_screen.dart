import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class HiringScreen extends StatelessWidget {
  const HiringScreen({super.key});

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
                'Contrataciones ',
                style: MyTheme.basicTextStyle(
                    size: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              const ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: MyTheme.fucsia,
                ),
                title: Text(
                  'Camila Gonzáles',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: MyTheme.fucsia,
                ),
                title: Text(
                  'Juliana Ramírez',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: MyTheme.fucsia,
                ),
                title: Text(
                  'Sara López',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: MyTheme.fucsia,
                ),
                title: Text(
                  'Carolina Jiménez',
                  style: TextStyle(color: Colors.white),
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
