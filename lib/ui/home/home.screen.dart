import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/custom_drawer.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/service_screens/controller/service_controller.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final serviceController = Get.find<ServiceController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurHome.png',
          fit: BoxFit.fill,
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            actions: [
              Icon(
                Icons.location_on_outlined,
                color: MyTheme.fucsia,
              ),
              SizedBox(
                  width: 40,
                  child: SearchField(
                    searchInputDecoration: InputDecoration(
                      border: InputBorder.none,
                      iconColor: MyTheme.fucsia,
                    ),
                    hint: 'Direcciones',
                    suggestions: ['Casa', 'Spa']
                        .map((e) => SearchFieldListItem(e,
                            child: Text(
                              e,
                              style: MyTheme.basicTextStyle(
                                  color: MyTheme.ocreOscuro,
                                  fontWeight: FontWeight.w500),
                            )))
                        .toList(),
                  )),
              Icon(Icons.arrow_drop_down_rounded),
              SizedBox(
                width: 20,
              )
            ],
            title: Container(
              width: 160,
              padding: const EdgeInsets.only(left: 60),
              child: SvgPicture.asset('assets/svg/LogoOcreoscuroyclaro.svg'),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_rounded,
                  color: MyTheme.fucsia,
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  Icons.home_filled,
                  color: MyTheme.verdeMenta,
                )
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Container(
                width: 100.w,
                height: 75.h,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(7),
                              width: 20,
                              height: double.maxFinite,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/pestanias.png'),
                                    fit: BoxFit.cover),
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Pestañas',
                                      style: TextStyle(
                                          fontFamily: 'MoonDream',
                                          fontSize: 20,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(7),
                                          width: 20,
                                          height: double.maxFinite,
                                          decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/peloblanco.png'),
                                                  fit: BoxFit.cover),
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(7),
                                          width: 20,
                                          height: double.maxFinite,
                                          decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/paleta.png'),
                                                  fit: BoxFit.cover),
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(7),
                                    width: double.maxFinite,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/brochas.png'),
                                            fit: BoxFit.cover),
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Hero(
                        tag: 'selectservice',
                        child: Material(
                          child: InkWell(
                            onTap: () async {
                              await serviceController.fillBaseServices();
                              Get.toNamed('/selectservice');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(7),
                              width: double.maxFinite,
                              height: double.maxFinite,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/servicioshome.png'),
                                      fit: BoxFit.cover),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' Uñas,\n Maquillaje y\n Spa',
                                    maxLines: 3,
                                    style: MyTheme.moonTextStyle(
                                        size: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(7),
                                width: 20,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/mano.png'),
                                        fit: BoxFit.cover),
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(7),
                                width: 20,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/labial.png'),
                                        fit: BoxFit.cover),
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(7),
                                width: 20,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/bagpink.png'),
                                        fit: BoxFit.cover),
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
