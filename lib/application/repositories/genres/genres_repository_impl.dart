import 'package:filmes_soumei/application/rest_client/rest_client.dart';
import 'package:filmes_soumei/models/genres_model.dart';
import 'package:flutter/foundation.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenresModel>> getGenres() async {
    final result = await _restClient.get<List<GenresModel>>('/genre/movie/list',
        query: {
          'api_key': '75bb68c9bbbb953c59aa39648d6e0f10',
          'language': 'pt-BR'
        }, decoder: (data) {
      final resultData = data['genres'];

      if (resultData != null) {
        return resultData
            .map<GenresModel>((g) => GenresModel.fromMap(g))
            .toList();
      }
      return <GenresModel>[];
    });

    if (result.hasError) {
      if (kDebugMode) {
        print(result.statusText);
      }
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenresModel>[];
  }
}
