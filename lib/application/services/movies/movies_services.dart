import 'package:filmes_soumei/models/movie_model.dart';

abstract class MoviesServices {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
}
