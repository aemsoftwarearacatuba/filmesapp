import 'package:filmes_soumei/application/repositories/genres/genres_repository.dart';
import 'package:filmes_soumei/application/repositories/genres/genres_repository_impl.dart';
import 'package:filmes_soumei/application/services/genres/genres_services.dart';
import 'package:filmes_soumei/application/services/genres/genres_services_impl.dart';
import 'package:filmes_soumei/modules/movies/movies_controller.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));

    Get.lazyPut<GenresServices>(
        () => GenresServicesImpl(genresRepository: Get.find()));

    Get.lazyPut(() => MoviesController(
          genresServices: Get.find(),
          moviesServices: Get.find(),
        ));
  }
}
