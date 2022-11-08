import 'package:films_app_flutter/UI/widgets/movies/movies_list_widget.dart';
import 'package:films_app_flutter/structure/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListPopularWidget extends StatelessWidget {
  final String titleSection;
  const MoviesListPopularWidget({
    Key? key,
    required this.titleSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
        init: MoviesController(),
        builder: (controller) {
          //Controlador para obtener las películas populares
          controller.getPopularMovies();
          //Widget de listas global
          return Obx(() => MoviesListWidget(
                movies: controller.popularMovies.value.results,
                titleSection: titleSection,
              ));
        });
  }
}
