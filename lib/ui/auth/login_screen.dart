import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holabella/ui/resources/buttons.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              SvgPicture.asset('assets/svg/LogoOcreBase.svg'),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  color: Colors.transparent,
                  ontap: () {},
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                '- O acceder con -',
                style:
                    MyTheme.basicTextStyle(size: 14, color: MyTheme.ocreOscuro),
              )
            ],
          )
        ],
      ),
    );
  }
}
