import 'package:filmes_soumei/application/rest_client/rest_client.dart';
import 'package:filmes_soumei/application/ui/custom_remote_config.dart';
import 'package:filmes_soumei/models/genre_model.dart';
import 'package:flutter/foundation.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result =
        await _restClient.get<List<GenreModel>>('/genre/movie/list', query: {
      'api_key': CustomRemoteConfig()
          .getValueOrDefault(key: 'apitoken', defaultValue: ''),
      'language': 'pt-BR'
    }, decoder: (data) {
      final resultData = data['genres'];

      if (resultData != null) {
        return resultData
            .map<GenreModel>((g) => GenreModel.fromMap(g))
            .toList();
      }
      return <GenreModel>[];
    });

    if (result.hasError) {
      if (kDebugMode) {
        print(result.statusText);
      }
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }
}
