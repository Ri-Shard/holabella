import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/custom_text.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
          Column(
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
                    controller: email,
                    labeltext: 'Correo',
                    prefix: const Icon(Icons.mail_outline_rounded),
                    suffix: const Icon(Icons.cancel_outlined),
                  )),
              const SizedBox(
                height: 17,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: CustomText(
                    controller: password,
                    labeltext: 'Contraseña',
                    prefix: const Icon(Icons.password),
                  )),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  ontap: () {},
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                '- O acceder con -',
                style:
                    MyTheme.basicTextStyle(size: 14, color: MyTheme.ocreOscuro),
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
          )
        ],
      ),
    );
  }
}
