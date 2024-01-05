import 'package:get/get.dart';
import 'package:holabella/ui/auth/login_base_screen.dart';
import 'package:holabella/ui/auth/login_screen.dart';
import 'package:holabella/ui/auth/register_screen.dart';
import 'package:holabella/ui/home/home.screen.dart';
import 'package:holabella/ui/service_screens/fill_data_screen.dart';
import 'package:holabella/ui/service_screens/pay_screen.dart';
import 'package:holabella/ui/service_screens/processing_pay_screen.dart';
import 'package:holabella/ui/service_screens/select_date_screen.dart';
import 'package:holabella/ui/service_screens/select_hour_screen.dart';
import 'package:holabella/ui/service_screens/select_service_screen.dart';
import 'package:holabella/ui/service_screens/service_resume_screen.dart';
import 'package:holabella/ui/service_screens/success_pay_screen.dart';
import 'package:holabella/ui/splash/splash_screen.dart';

appRoutes() => [
      GetPage(
        name: '/register',
        page: () => RegisterScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/login',
        page: () => LoginScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/loginbase',
        page: () => const LoginBaseScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/splash',
        page: () => const SplashScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/home',
        page: () => const HomeScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/selectservice',
        page: () => const SelectServiceScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/selectdate',
        page: () => const SelectDateScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/selecthour',
        page: () => const SelectHourScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/serviceresume',
        page: () => const ServiceResumeScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/servicedatos',
        page: () => const FillDataScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/servicepay',
        page: () => const PayScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/serviceprocesingpay',
        page: () => const ProcessingPayScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/servicesuccesspay',
        page: () => const SuccessPayScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
