import 'package:filmes_soumei/models/genres_model.dart';

abstract class GenresServices {
  Future<List<GenresModel>> getGenres();
}
