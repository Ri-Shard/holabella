import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurSelectService.png',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'selectservice',
                        child: Material(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            width: 50.w,
                            height: 50.w,
                            child: Stack(children: [
                              Image.asset(
                                'assets/images/circlebackground.png',
                              ),
                              Opacity(
                                opacity: 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/paletaredonda.png',
                                    colorBlendMode: BlendMode.overlay,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Selecciona \n un Servicio',
                                  maxLines: 3,
                                  style: MyTheme.basicTextStyle(
                                      size: 35, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Text(
                        'Por favor, seleccione un servicio',
                        style: MyTheme.basicTextStyle(
                            size: 15,
                            fontWeight: FontWeight.normal,
                            color: MyTheme.ocreBase),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomSelect(
                        prefix: Icon(Icons.filter_list_rounded),
                        items: ['asd', 'asda'],
                        title: 'Categoria',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomSelect(
                        prefix: Icon(Icons.filter_list_rounded),
                        items: ['asd', 'asda'],
                        title: 'Servicio',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomSelect(
                        items: ['asd', 'asda'],
                        title: 'Persona',
                        prefix: Icon(Icons.person_outline),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/selectdate');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'SIGUIENTE  ',
                          style: MyTheme.basicTextStyle(
                              color: MyTheme.ocreBase,
                              size: 40,
                              fontWeight: FontWeight.normal),
                        ),
                        Flexible(
                            child: SvgPicture.asset('assets/svg/Arrow.svg'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar()),
      ],
    );
  }
}
