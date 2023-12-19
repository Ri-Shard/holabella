import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          body: Column(
            children: [
              Expanded(
                child: Container(
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
                                    Text(
                                      'Pestañas',
                                      style: MyTheme.basicTextStyle(
                                          size: 30,
                                          fontWeight: FontWeight.w400),
                                    ),
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
                              onTap: () {
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
                                      style: MyTheme.basicTextStyle(
                                          size: 30,
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
              ),
              Container(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
