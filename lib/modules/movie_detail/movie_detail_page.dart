import 'package:filmes_soumei/modules/movie_detail/widget/movie_detail_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDetailPage'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              MovieDetailHeader(
                movie: controller.movie.value,
              ),
            ],
          );
        }),
      ),
    );
  }
}
