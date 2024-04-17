import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/hour_model.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_drawer.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/service_screens/controller/service_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

List<DateTime?> _dates = [];
DateTime date = DateTime.now();
String selectDate = '';
String selectedHour = '';

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime _selectedTime = DateTime.now();
  final serviceController = Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    print(serviceController.newService);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/BlurDate.png',
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(),
          drawer: CustomDrawer(),
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
              GetBuilder(
                  id: 'servicehour',
                  init: serviceController,
                  builder: (_) {
                    selectDate = DateFormat('EEE, MMM dd', 'es').format(date);
                    return Container(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              config: CalendarDatePicker2Config(
                                  calendarType: CalendarDatePicker2Type.single,
                                  firstDate: DateTime.now()),
                              value: _dates,
                              onValueChanged: (dates) {
                                _dates = dates;
                                selectDate = DateFormat('EEE, MMM dd', 'es')
                                    .format(_dates[0]!);

                                _showHourPicker();
                                _.update(['servicehour']);
                              },
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
                        ));
                  }),
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
                        if (selectedHour == '') {
                          Get.snackbar('Error', 'Favor seleccionar una hora');
                        } else {
                          serviceController.newService?.hour = selectedHour;
                          serviceController.newService?.date =
                              _dates[0].toString();

                          serviceController.newServicesData
                              .add(serviceController.newService);
                          Get.toNamed('/serviceresume', arguments: selectDate);
                        }
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

  void _showHourPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        RxInt hourIndex = (-1).obs;
        RxList<Schedule> hours = [
          Schedule(hour: '8:00 am', status: 0),
          Schedule(hour: '8:15 am', status: 0),
          Schedule(hour: '8:30 am', status: 0),
          Schedule(hour: '8:45 am', status: 0),
          Schedule(hour: '9:00 am', status: 0),
          Schedule(hour: '9:15 am', status: 0),
          Schedule(hour: '9:30 am', status: 0),
          Schedule(hour: '9:45 am', status: 0),
          Schedule(hour: '10:00 am', status: 0),
          Schedule(hour: '10:15 am', status: 0),
          Schedule(hour: '10:30 am', status: 0),
          Schedule(hour: '10:45 am', status: 0),
          Schedule(hour: '11:00 am', status: 0),
          Schedule(hour: '11:15 am', status: 0),
          Schedule(hour: '11:30 am', status: 0),
          Schedule(hour: '11:45 am', status: 0),
          Schedule(hour: '12:00 pm', status: 0),
          Schedule(hour: '2:00 pm', status: 0),
          Schedule(hour: '2:15 pm', status: 0),
          Schedule(hour: '2:30 pm', status: 0),
          Schedule(hour: '2:45 pm', status: 0),
          Schedule(hour: '3:00 pm', status: 0),
          Schedule(hour: '3:15 pm', status: 0),
          Schedule(hour: '3:30 pm', status: 0),
          Schedule(hour: '3:45 pm', status: 0),
          Schedule(hour: '4:00 pm', status: 0),
          Schedule(hour: '4:15 pm', status: 0),
          Schedule(hour: '4:30 pm', status: 0),
        ].obs;
        return ListView(
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
                        'Horarios disponibles. $selectDate',
                        style: MyTheme.basicTextStyle(
                            size: 15,
                            fontWeight: FontWeight.normal,
                            color: MyTheme.ocreBase),
                      ),
                    ),
                    Obx(() {
                      return SizedBox(
                        height: 40.h,
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(8),
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 2 / 1,
                          crossAxisCount: 4,
                          children: List.generate(hours.length, (index) {
                            return InkWell(
                              onTap: () {
                                hourIndex.value = index;
                                hours[index].status == 1
                                    ? hours[index].status = 0
                                    : hours[index].status = 1;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: MyTheme.ocreBase),
                                  color: hourIndex.value == index
                                      ? MyTheme.ocreBase
                                      : Colors.transparent,
                                ),
                                child: Center(
                                    child: Text(
                                  hours[index].hour!,
                                  style: MyTheme.basicTextStyle(
                                    size: 15,
                                    color: hourIndex.value == index
                                        ? Colors.white
                                        : MyTheme.ocreBase,
                                  ),
                                )),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.schedule)),
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(fontSize: 15),
                              )),
                          TextButton(
                              onPressed: () {
                                if (hourIndex == (-1).obs) {
                                  Get.snackbar(
                                      'Error', 'Favor seleccionar una hora');
                                } else {
                                  selectedHour = hours[hourIndex.toInt()].hour!;
                                  print(selectedHour);
                                  serviceController.update(['servicehour']);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('OK',
                                  style: TextStyle(fontSize: 15)))
                        ],
                      ),
                    )
                  ],
                )),
          ],
        );
      },
    );
  }

  bool isWithinWorkingHours(TimeOfDay timeOfDay) {
    const startTime = TimeOfDay(hour: 8, minute: 0);
    const endTime = TimeOfDay(hour: 17, minute: 0);
    // Compare hours using comparison operators
    if (timeOfDay.hour > startTime.hour) {
      return true;
    } else if (timeOfDay.hour == startTime.hour) {
      // If hours are equal, check minutes
      return timeOfDay.minute >= startTime.minute;
    } else {
      return false;
    }
  }
}
