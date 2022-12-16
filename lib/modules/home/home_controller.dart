import 'package:filmes_soumei/application/services/login/login_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const navigatorKey = 1;
  static const indexPageExit = 2;

  final LoginService _loginService;

  HomeController({required LoginService loginService})
      : _loginService = loginService;

  final _pageIndex = 0.obs;
  final _pages = ['/movies', '/favorites'];

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);

    if (page == indexPageExit) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: navigatorKey);
    }
  }
}
