import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holabella/models/user_model.dart';
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
  final GlobalKey<FormState> _key = GlobalKey();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    visible = Get.arguments == 'password' ? false : true;

    return Scaffold(
      body: Stack(
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
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: CustomText(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'Campo vacio, ingrese el nombre';
                          }
                        },
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
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'Campo vacio, ingrese el numero de telefono';
                          }
                          if (p0.length != 10) {
                            return 'Numero de telefono invalido';
                          }
                        },
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
                        if (email.text.isEmpty) {
                          email.text = _.authInstance.currentUser?.email ?? "";
                        }

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
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
                                    _.update(['registerView']);
                                  },
                                  inputType: TextInputType.emailAddress,
                                  enable: visible,
                                  controller: email,
                                  labeltext: 'Correo',
                                  prefix:
                                      const Icon(Icons.mail_outline_rounded),
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
                            Visibility(
                              visible: visible,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: CustomText(
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return 'Campo vacio, ingrese una contraseña valida';
                                      }
                                      if (p0.length < 6) {
                                        return 'La contraseña debe tener mas de 6 caracteres';
                                      }
                                    },
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
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Visibility(
                              visible: visible,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: CustomText(
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return 'Campo vacio, ingrese la confirmacion de contraseña';
                                      }
                                      if (p0.length < 6) {
                                        return 'La contraseña debe tener mas de 6 caracteres';
                                      }
                                    },
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
                                    controller: passwordConfirm,
                                    labeltext: 'Verifica tu contraseña',
                                    prefix: const Icon(Icons.password),
                                  )),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
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
                                          style: MyTheme.basicTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  color: MyTheme.ocreBase,
                                  ontap: () {
                                    if (_key.currentState!.validate()) {
                                      if (Get.arguments != "password") {
                                        _.signUpMail(
                                            email.text.trim(),
                                            password.text.trim(),
                                            User(
                                                email: email.text.trim(),
                                                name: name.text.trim(),
                                                phone: phone.text.trim()));
                                        _.saveUser(User(
                                            email: email.text.trim(),
                                            name: name.text.trim(),
                                            phone: phone.text.trim()));
                                      } else {
                                        _.signUpMail(
                                            email.text.trim(),
                                            password.text.trim(),
                                            User(
                                                email: email.text.trim(),
                                                name: name.text.trim(),
                                                phone: phone.text.trim()));
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
