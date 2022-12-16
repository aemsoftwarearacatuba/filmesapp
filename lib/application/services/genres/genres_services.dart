import 'package:filmes_soumei/models/genre_model.dart';

abstract class GenresServices {
  Future<List<GenreModel>> getGenres();
}
