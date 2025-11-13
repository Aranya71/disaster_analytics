import 'package:get/get.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/alert/controllers/alert_controller.dart';
import '../modules/alert/views/alert_view.dart';
import '../modules/emergency/controllers/emergency_controller.dart';
import '../modules/emergency/views/emergency_view.dart';
import '../modules/chat/controllers/chat_controller.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/report/controllers/report_controller.dart';
import '../modules/report/views/report_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => HomeController())),
    ),
    GetPage(
      name: Routes.ALERT,
      page: () => const AlertView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AlertController())),
    ),
    GetPage(
      name: Routes.EMERGENCY,
      page: () => const EmergencyView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => EmergencyController())),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ChatController())),
    ),
    GetPage(
      name: Routes.REPORT,
      page: () => const ReportView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ReportController())),
    ),
  ];
}