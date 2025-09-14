import 'package:get/get.dart';
import '../page/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;

  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
  ];
}
