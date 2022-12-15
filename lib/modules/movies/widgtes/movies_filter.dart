import 'package:filmes_soumei/modules/movies/movies_controller.dart';
import 'package:filmes_soumei/modules/movies/widgtes/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilter extends GetView<MoviesController> {
  const MoviesFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return Row(
              children: controller.genres
                  .map((g) => FilterTag(
                      model: g,
                      onPressed: () => controller.filterMoviesByGenre(g),
                      selected: controller.genreSelected.value?.id == g.id))
                  .toList(),
            );
          })),
    );
  }
}
