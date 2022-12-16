import 'package:filmes_soumei/application/bindings/application_bindings.dart';
import 'package:filmes_soumei/application/ui/custom_remote_config.dart';
import 'package:filmes_soumei/application/ui/filmes_app_ui_config.dart';
import 'package:filmes_soumei/firebase_options.dart';
import 'package:filmes_soumei/modules/home/home_module.dart';
import 'package:filmes_soumei/modules/login/login_module.dart';
import 'package:filmes_soumei/modules/movie_detail/movie_detail_module.dart';
import 'package:filmes_soumei/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseRemoteConfig.instance.fetchAndActivate();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CustomRemoteConfig().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      title: FilmesAppUiConfig.title,
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers
      ],
    );
  }
}
