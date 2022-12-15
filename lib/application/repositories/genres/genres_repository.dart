import 'package:filmes_soumei/models/genres_model.dart';

abstract class GenresRepository {
  Future<List<GenresModel>> getGenres();
}
