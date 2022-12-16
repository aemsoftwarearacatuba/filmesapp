import 'package:filmes_soumei/application/services/movies/movies_services.dart';
import 'package:filmes_soumei/application/ui/loader/loader_mixin.dart';
import 'package:filmes_soumei/application/ui/messages/messages_mixin.dart';
import 'package:filmes_soumei/models/movies_detail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MoviesDetailModel>();

  final MoviesServices _moviesServices;

  MovieDetailController({required MoviesServices moviesServices})
      : _moviesServices = moviesServices;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final movieId = Get.arguments;
      loading(true);

      final movieDetailData = await _moviesServices.getDetail(movieId);

      movie(movieDetailData);

      loading(false);
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
        loading(false);

        message(MessageModel.error('Erro', 'Erro ao buscar detalhes do filme'));
      }
    }
  }
}
