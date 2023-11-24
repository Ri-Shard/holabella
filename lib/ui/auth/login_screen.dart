import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _key = GlobalKey();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          id: 'loginView',
          init: authController,
          builder: (_) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/Blur.png',
                  fit: BoxFit.fill,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        SvgPicture.asset('assets/svg/LogoOcreoscuroyclaro.svg'),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: CustomText(
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'Campo vacio, ingrese un correo';
                                }
                                if (p0 != null) {
                                  if (!GetUtils.isEmail(p0.trim())) {
                                    return 'Correo no valido';
                                  }
                                }
                              },
                              onChanged: (text) {
                                _.update(['loginView']);
                              },
                              inputType: TextInputType.emailAddress,
                              controller: email,
                              labeltext: 'Correo',
                              prefix: const Icon(Icons.mail_outline_rounded),
                              suffix: InkWell(
                                child: const Icon(Icons.cancel_outlined),
                                onTap: () {
                                  email.clear();
                                  _.update(['loginView']);
                                },
                              ),
                            )),
                        const SizedBox(
                          height: 17,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: CustomText(
                              onChanged: (text) {
                                _.update(['loginView']);
                              },
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'Campo vacio, ingrese una contraseña valida';
                                }
                                if (p0.length < 6) {
                                  return 'La contraseña debe tener mas de 6 caracteres';
                                }
                              },
                              suffix: InkWell(
                                child: Icon(!obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                onTap: () {
                                  obscureText = !obscureText;
                                  _.update(['registerView']);
                                },
                              ),
                              obscureText: obscureText,
                              controller: password,
                              labeltext: 'Contraseña',
                              prefix: const Icon(Icons.password),
                            )),
                        const SizedBox(
                          height: 17,
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
                                if (_key.currentState!.validate()) {
                                  _.signInMail(
                                      email.text.trim(), password.text.trim());
                                }
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
                              ontap: () {
                                print('ASDDDDDDDDDDDDD');
                              },
                              borderradius: 20,
                              content: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: SvgPicture.asset(
                                    'assets/svg/facebookLogo.svg'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Buttons(
                              ontap: () {
                                print('ASDDDDDDDDDDDDD');
                                authController.signInWithGoogle();
                              },
                              borderradius: 20,
                              content: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: SvgPicture.asset(
                                    'assets/svg/GoogleLogo.svg'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
