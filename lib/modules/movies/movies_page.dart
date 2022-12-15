import 'package:filmes_soumei/modules/movies/movies_controller.dart';
import 'package:filmes_soumei/modules/movies/widgtes/movies_filter.dart';
import 'package:filmes_soumei/modules/movies/widgtes/movies_group.dart';
import 'package:filmes_soumei/modules/movies/widgtes/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          const MoviesHeader(),
          const MoviesFilter(),
          MoviesGroup(
            title: 'Mais Populares',
            movies: controller.popularMovies,
          ),
          MoviesGroup(
            title: 'Top Filmes',
            movies: controller.topRatedMovies,
          ),
        ],
      ),
    );
  }
}
