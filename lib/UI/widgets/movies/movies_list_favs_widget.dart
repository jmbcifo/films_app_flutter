import 'package:films_app_flutter/UI/widgets/movies/movies_list_widget.dart';
import 'package:films_app_flutter/structure/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListFavsWidget extends StatelessWidget {
  final String titleSection;
  const MoviesListFavsWidget({Key? key, required this.titleSection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(builder: (controller) {
      //Esta lista es la lista peliculas populares ordenadas de mayor a menor valoración
      controller.getFavMovies();
      return Obx(() => MoviesListWidget(
            movies: controller.favMovies.value,
            titleSection: titleSection,
          ));
    });
  }
}
