import 'package:filmes_soumei/application/services/genres/genres_services.dart';
import 'package:filmes_soumei/application/services/movies/movies_services.dart';
import 'package:filmes_soumei/application/ui/messages/messages_mixin.dart';
import 'package:filmes_soumei/models/genres_model.dart';
import 'package:filmes_soumei/models/movie_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresServices _genresServices;
  final MoviesServices _moviesServices;

  final _message = Rxn<MessageModel>();
  final genres = <GenresModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  final _popularMoviesOriginal = <MovieModel>[];
  final _topRatedMoviesOriginal = <MovieModel>[];

  MoviesController(
      {required GenresServices genresServices,
      required MoviesServices moviesServices})
      : _genresServices = genresServices,
        _moviesServices = moviesServices;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genrespData = await _genresServices.getGenres();
      genres.assignAll(genrespData);

      final popularMoviesData = await _moviesServices.getPopularMovies();
      popularMovies.assignAll(popularMoviesData);

      final topRatedMoviesData = await _moviesServices.getTopRated();
      topRatedMovies.assignAll(topRatedMoviesData);
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      _message(MessageModel.error('Erro', 'Erro carregar dados da pagina'));
    }
  }
}
