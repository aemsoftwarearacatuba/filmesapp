import 'package:filmes_soumei/application/auth/auth_service.dart';
import 'package:filmes_soumei/application/services/genres/genres_services.dart';
import 'package:filmes_soumei/application/services/movies/movies_services.dart';
import 'package:filmes_soumei/application/ui/messages/messages_mixin.dart';
import 'package:filmes_soumei/models/genre_model.dart';
import 'package:filmes_soumei/models/movie_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresServices _genresServices;
  final MoviesService _moviesServices;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final genreSelected = Rxn<GenreModel>();

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  MoviesController({
    required GenresServices genresServices,
    required MoviesService moviesServices,
    required AuthService authService,
  })  : _genresServices = genresServices,
        _moviesServices = moviesServices,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresServices.getGenres();
      genres.assignAll(genresData);

      await getMovies();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da pagina'));
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesServices.getPopularMovies();
      var topRatedMoviesData = await _moviesServices.getTopRated();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;

      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }

      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da pagina'));
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

  void filterMoviesByGenre(GenreModel? genremovel) {
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

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesServices.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesServices.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
