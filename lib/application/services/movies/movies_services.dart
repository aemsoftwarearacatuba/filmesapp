import 'package:filmes_soumei/models/movie_model.dart';
import 'package:filmes_soumei/models/movies_detail_model.dart';

abstract class MoviesServices {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
}
