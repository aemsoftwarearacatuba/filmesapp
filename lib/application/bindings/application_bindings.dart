import 'package:filmes_soumei/application/auth/auth_service.dart';
import 'package:filmes_soumei/application/repositories/login/login_repository.dart';
import 'package:filmes_soumei/application/repositories/login/login_repository_impl.dart';
import 'package:filmes_soumei/application/repositories/movies/movies_repository.dart';
import 'package:filmes_soumei/application/repositories/movies/movies_repository_impl.dart';
import 'package:filmes_soumei/application/rest_client/rest_client.dart';
import 'package:filmes_soumei/application/services/login/login_service.dart';
import 'package:filmes_soumei/application/services/login/login_service_impl.dart';
import 'package:filmes_soumei/application/services/movies/movies_services.dart';
import 'package:filmes_soumei/application/services/movies/movies_services_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => RestClient(), fenix: true);
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(loginRepository: Get.find()),
      fenix: true,
    );
    Get.put(AuthService()).init();

    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(
              restClient: Get.find(),
            ),
        fenix: true);
    Get.lazyPut<MoviesService>(
        () => MoviesServicesImpl(moviesRepository: Get.find()),
        fenix: true);
  }
}
