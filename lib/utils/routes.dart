import 'package:appointment_manager/screens/calendar/calendar.dart';
import 'package:appointment_manager/screens/login/login.dart';
import 'package:appointment_manager/screens/register/register.dart';
import 'package:get/get.dart';

class Routes {
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String calendarPage = '/calendarPage';

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: loginPage,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: registerPage,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: calendarPage,
      page: () => const CalendarPage(),
    ),
  ];
}
