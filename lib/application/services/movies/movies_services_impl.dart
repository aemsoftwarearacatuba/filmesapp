import 'package:filmes_soumei/application/repositories/movies/movies_repository.dart';
import 'package:filmes_soumei/models/movie_model.dart';
import 'package:filmes_soumei/models/movies_detail_model.dart';

import './movies_services.dart';

class MoviesServicesImpl implements MoviesServices {
  final MoviesRepository _moviesRepository;
  MoviesServicesImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) =>
      _moviesRepository.getDetail(id);
}
