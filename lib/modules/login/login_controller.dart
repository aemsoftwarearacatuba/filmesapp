import 'package:filmes_soumei/application/services/login/login_service.dart';
import 'package:filmes_soumei/application/ui/loader/loader_mixin.dart';
import 'package:filmes_soumei/application/ui/messages/messages_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
        'Sucesso',
        'Login realizado com sucesso!',
      ));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }

      loading(false);
      message(MessageModel.error(
        'Erro',
        'Erro ao realizado o login!',
      ));
    }
  }
}
