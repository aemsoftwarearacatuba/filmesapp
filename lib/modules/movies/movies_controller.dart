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

  final genreSelected = Rxn<GenresModel>();

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

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
      _popularMoviesOriginal = popularMoviesData;

      final topRatedMoviesData = await _moviesServices.getTopRated();
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      _message(MessageModel.error('Erro', 'Erro carregar dados da pagina'));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newpopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newtopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newpopularMovies);
      topRatedMovies.assignAll(newtopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenresModel? genremovel) {
    var genreFilter = genremovel;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }

    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newpopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      var newtopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      popularMovies.assignAll(newpopularMovies);
      topRatedMovies.assignAll(newtopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }
}
