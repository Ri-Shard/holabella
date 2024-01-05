import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

List<DateTime?> _dates = [];
DateTime date = DateTime.now();
String selectDate = DateFormat('EEE, MMM dd', 'es').format(date);

class _SelectDateScreenState extends State<SelectDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurDate.png',
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(),
          drawer: const Drawer(),
          appBar: AppBar(
            actions: const [
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.shopping_basket_outlined,
                color: MyTheme.fucsia,
              ),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Text(
                          'Por favor, seleccione una fecha adecuada.',
                          style: MyTheme.basicTextStyle(
                              size: 15,
                              fontWeight: FontWeight.normal,
                              color: MyTheme.ocreBase),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectDate,
                              style: MyTheme.basicTextStyle(
                                  size: 40,
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.ocreBase),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit_outlined))
                          ],
                        ),
                      ),
                      const Divider(
                        color: MyTheme.purpura,
                      ),
                      CalendarDatePicker2(
                        config: CalendarDatePicker2Config(),
                        value: _dates,
                        onValueChanged: (dates) => _dates = dates,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(fontSize: 15),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text('OK',
                                  style: TextStyle(fontSize: 15)))
                        ],
                      )
                    ],
                  )),
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
                        Get.toNamed('/selecthour', arguments: selectDate);
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
        ),
      ],
    );
  }
}
