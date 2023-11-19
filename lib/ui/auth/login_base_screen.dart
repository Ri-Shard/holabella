import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/auth/login_screen.dart';
import 'package:holabella/ui/auth/register_screen.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class LoginBaseScreen extends StatelessWidget {
  const LoginBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      body: GetBuilder(
          id: 'loginbaseView',
          init: authController,
          builder: (_) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/Blur.png',
                  fit: BoxFit.fill,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    SvgPicture.asset('assets/svg/LogoOcreBase.svg'),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Hero(
                        tag: 'loginBtn',
                        child: Buttons(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  'Iniciar Sesion',
                                  style: MyTheme.basicTextStyle(),
                                ),
                              ),
                            ],
                          ),
                          color: MyTheme.ocreBase,
                          ontap: () {
                            Get.to(LoginScreen());
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Hero(
                        tag: 'registerBtn',
                        child: Buttons(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  'Registrarse',
                                  style: MyTheme.basicTextStyle(
                                      color: MyTheme.ocreOscuro),
                                ),
                              ),
                            ],
                          ),
                          color: Colors.transparent,
                          ontap: () {
                            Get.to(RegisterScreen());
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      '- O acceder con -',
                      style: MyTheme.basicTextStyle(
                          size: 14, color: MyTheme.ocreOscuro),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons(
                          borderradius: 20,
                          content: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child:
                                SvgPicture.asset('assets/svg/facebookLogo.svg'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Buttons(
                          borderradius: 20,
                          content: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child:
                                SvgPicture.asset('assets/svg/GoogleLogo.svg'),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          }),
    );
  }
}
