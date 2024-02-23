import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/service_screens/controller/service_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              color: MyTheme.fucsia,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: () {
              Get.offAllNamed('/home');
            },
            child: const Icon(
              Icons.home_filled,
              color: MyTheme.verdeMenta,
            ),
          )
        ],
      ),
    );
  }
}
