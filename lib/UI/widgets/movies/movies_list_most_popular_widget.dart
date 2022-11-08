import 'package:films_app_flutter/UI/widgets/movies/movies_list_widget.dart';
import 'package:films_app_flutter/structure/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListMostPopularWidget extends StatelessWidget {
  final String titleSection;
  const MoviesListMostPopularWidget({
    Key? key,
    required this.titleSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(builder: (controller) {
      controller.getMostPopularMovies();
      return Obx(() => MoviesListWidget(
            movies: controller.mostPopularMovies.value,
            titleSection: titleSection,
          ));
    });
  }
}
