import 'package:filmes_soumei/application/rest_client/rest_client.dart';
import 'package:filmes_soumei/models/movie_model.dart';
import 'package:flutter/foundation.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': '75bb68c9bbbb953c59aa39648d6e0f10',
        'language': 'pt-BR',
        'page': '1'
      },
      decoder: (data) {
        final resultData = data['results'];

        if (resultData != null) {
          return resultData
              .map<MovieModel>((v) => MovieModel.fromMap(v))
              .toList();
        }
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      if (kDebugMode) {
        print(result.statusText);
      }
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': '75bb68c9bbbb953c59aa39648d6e0f10',
        'language': 'pt-BR',
        'page': '1'
      },
      decoder: (data) {
        final resultData = data['results'];

        if (resultData != null) {
          return resultData
              .map<MovieModel>((v) => MovieModel.fromMap(v))
              .toList();
        }
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      if (kDebugMode) {
        print(result.statusText);
      }
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <MovieModel>[];
  }
}
