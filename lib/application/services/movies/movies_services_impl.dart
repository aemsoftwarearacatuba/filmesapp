import 'package:filmes_soumei/application/repositories/movies/movies_repository.dart';
import 'package:filmes_soumei/models/movie_model.dart';
import 'package:filmes_soumei/models/movies_detail_model.dart';

import './movies_services.dart';

class MoviesServicesImpl implements MoviesService {
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

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) =>
      _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) =>
      _moviesRepository.getFavoritiesMovies(userId);
}
