import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:holabella/models/service_model.dart';
import 'package:holabella/ui/resources/bottom_navigation_bar.dart';
import 'package:holabella/ui/resources/custom_select.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:holabella/ui/service_screens/controller/service_controller.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  Map<String, List<ServiceModel>> sortedServices = {};
  @override
  Widget build(BuildContext context) {
    String? selectedCategory = 'Uñas';
    int? selectedService = 0;
    String? selectedPrice;
    String? selectedPeople = '';
    final focus = FocusNode();
    final focus2 = FocusNode();
    final focus3 = FocusNode();
    final _categoryController = TextEditingController();
    final _serviceController = TextEditingController();
    final _personController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    final serviceController = Get.find<ServiceController>();
    sortedServices = {};
    for (ServiceModel? e in serviceController.servicesData) {
      if (!sortedServices.containsKey(e!.category)) {
        sortedServices[e.category!] = [e];
      } else {
        sortedServices[e.category]!.add(e);
      }
    }

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
                                child: Text('Selecciona \n un Servicio',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'MoonDream',
                                      fontSize: 25,
                                      color: Colors.white,
                                    )
                                    // MyTheme.basicTextStyle(
                                    //     size: 35, fontWeight: FontWeight.w400),
                                    ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      GetBuilder(
                        id: 'selectService',
                        init: Get.find<ServiceController>(),
                        builder: (_) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              children: [
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
                                SearchField(
                                  searchInputDecoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.filter_list_rounded),
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down_rounded),
                                      labelText: 'Categoria',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  marginColor: MyTheme.ocreBase,
                                  hint: 'Seleccione',
                                  suggestionsDecoration: SuggestionDecoration(
                                      padding: const EdgeInsets.all(4),
                                      border:
                                          Border.all(color: MyTheme.ocreOscuro),
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(10))),
                                  suggestions: sortedServices.keys
                                      .toList()
                                      .map((e) => SearchFieldListItem<String>(e,
                                          child: Text(
                                            e,
                                            style: MyTheme.basicTextStyle(
                                                color: MyTheme.ocreOscuro,
                                                fontWeight: FontWeight.w500),
                                          )))
                                      .toList(),
                                  focusNode: focus,
                                  controller: _categoryController,
                                  validator: (x) {
                                    if (x!.isEmpty) {
                                      return 'Por favor seleccione';
                                    }
                                    return null;
                                  },
                                  onSuggestionTap:
                                      (SearchFieldListItem<String> p0) {
                                    selectedCategory = p0.searchKey;
                                    _personController.clear();
                                    _serviceController.clear();
                                    selectedService = 0;
                                    focus.unfocus();
                                    _.update(['selectService']);
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SearchField(
                                  searchInputDecoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.filter_list_rounded),
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down_rounded),
                                      labelText: 'Servicio',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  marginColor: MyTheme.ocreBase,
                                  hint: 'Seleccione',
                                  suggestionsDecoration: SuggestionDecoration(
                                      padding: const EdgeInsets.all(4),
                                      border:
                                          Border.all(color: MyTheme.ocreOscuro),
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(10))),
                                  suggestions: sortedServices[selectedCategory]!
                                      .map((e) => SearchFieldListItem<String>(
                                          e.name ?? '',
                                          child: Text(
                                            e.name ?? ' ',
                                            style: MyTheme.basicTextStyle(
                                                color: MyTheme.ocreOscuro,
                                                fontWeight: FontWeight.w500),
                                          )))
                                      .toList(),
                                  focusNode: focus2,
                                  controller: _serviceController,
                                  validator: (x) {
                                    if (x!.isEmpty) {
                                      return 'Por favor seleccione';
                                    }
                                    return null;
                                  },
                                  onSuggestionTap:
                                      (SearchFieldListItem<String> p0) {
                                    for (var i = 0;
                                        i <
                                            sortedServices[selectedCategory]!
                                                .length;
                                        i++) {
                                      if (sortedServices[selectedCategory]![i]
                                              .name ==
                                          p0.searchKey) {
                                        selectedService = i;
                                        selectedPrice =
                                            sortedServices[selectedCategory]![i]
                                                .price;
                                      }
                                    }
                                    focus2.unfocus();
                                    _.update(['selectService']);
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SearchField(
                                  searchInputDecoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline),
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down_rounded),
                                      labelText: 'Persona',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  marginColor: MyTheme.ocreBase,
                                  hint: 'Seleccione',
                                  suggestionsDecoration: SuggestionDecoration(
                                      padding: const EdgeInsets.all(4),
                                      border:
                                          Border.all(color: MyTheme.ocreOscuro),
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(10))),
                                  suggestions: sortedServices[
                                          selectedCategory]![selectedService!]
                                      .ambassador!
                                      .toList()
                                      .map((e) => SearchFieldListItem<String>(e,
                                          child: Text(
                                            e,
                                            style: MyTheme.basicTextStyle(
                                                color: MyTheme.ocreOscuro,
                                                fontWeight: FontWeight.w500),
                                          )))
                                      .toList(),
                                  focusNode: focus3,
                                  controller: _personController,
                                  validator: (x) {
                                    if (x!.isEmpty) {
                                      return 'Por favor seleccione';
                                    }
                                    return null;
                                  },
                                  onSuggestionTap:
                                      (SearchFieldListItem<String> p0) {
                                    selectedPeople = p0.searchKey;
                                    focus3.unfocus();
                                    _.update(['selectService']);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ServiceModel serviceaux = ServiceModel();
                        serviceaux.name = _serviceController.text;
                        serviceaux.person = _personController.text;
                        serviceaux.category = _categoryController.text;
                        serviceaux.price = selectedPrice;

                        serviceController.newService = serviceaux;
                        Get.toNamed('/selectdate');
                      }
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
