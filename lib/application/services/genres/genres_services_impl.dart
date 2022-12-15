import 'package:filmes_soumei/application/repositories/genres/genres_repository.dart';
import 'package:filmes_soumei/models/genres_model.dart';

import './genres_services.dart';

class GenresServicesImpl implements GenresServices {
  final GenresRepository _genresRepository;

  GenresServicesImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  @override
  Future<List<GenresModel>> getGenres() => _genresRepository.getGenres();
}
