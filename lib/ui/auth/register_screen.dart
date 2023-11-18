import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/auth/auth_controller.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirm = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Blur.png',
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: CustomText(
                      controller: name,
                      labeltext: 'Nombres',
                      prefix: const Icon(Icons.person_3_outlined),
                    )),
                const SizedBox(
                  height: 17,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: CustomText(
                      inputType: TextInputType.number,
                      controller: phone,
                      labeltext: 'Celular',
                      prefix: const Icon(Icons.phone_android_rounded),
                    )),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder(
                    id: 'registerView',
                    init: Get.find<AuthController>(),
                    builder: (_) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: CustomText(
                                onChanged: (text) {
                                  _.update(['registerView']);
                                },
                                inputType: TextInputType.emailAddress,
                                controller: email,
                                labeltext: 'Correo',
                                prefix: const Icon(Icons.mail_outline_rounded),
                                suffix: InkWell(
                                  child: const Icon(Icons.cancel_outlined),
                                  onTap: () {
                                    email.clear();
                                    _.update(['registerView']);
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
                                  _.update(['registerView']);
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: CustomText(
                                onChanged: (text) {
                                  _.update(['registerView']);
                                },
                                suffix: Icon(!obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                obscureText: obscureText,
                                controller: passwordConfirm,
                                labeltext: 'Verifica tu contraseña',
                                prefix: const Icon(Icons.password),
                              )),
                          const SizedBox(
                            height: 17,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Buttons(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Text(
                                      'Registrarse',
                                      style: MyTheme.basicTextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                              color: MyTheme.ocreBase,
                              ontap: email.text.isEmpty ||
                                      password.text.isEmpty ||
                                      passwordConfirm.text.isEmpty
                                  ? null
                                  : () {
                                      _.signUpMail(email.text.trim(),
                                          password.text.trim());
                                    },
                            ),
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  '- O acceder con -',
                  style: MyTheme.basicTextStyle(
                      size: 14, color: MyTheme.ocreOscuro),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Buttons(
                      borderradius: 20,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: SvgPicture.asset('assets/svg/facebookLogo.svg'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Buttons(
                      borderradius: 20,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: SvgPicture.asset('assets/svg/GoogleLogo.svg'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
