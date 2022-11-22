import 'package:films_app_flutter/UI/themes/colors_theme.dart';
import 'package:films_app_flutter/UI/widgets/movies/movies_list_favs_widget.dart';
import 'package:films_app_flutter/UI/widgets/movies/movies_list_most_popular_widget.dart';
import 'package:films_app_flutter/UI/widgets/movies/movies_list_popular_widget.dart';
import 'package:flutter/material.dart';

class SectionFilmsWidget extends StatelessWidget {
  const SectionFilmsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              //Esta es la lista de las peliculas populares de origen
              MoviesListPopularWidget(
                titleSection: "RECOMENDADO PARA TI",
              ),
              //Esta es la lista de películas ordenadas en función de la popularidad
              MoviesListMostPopularWidget(
                titleSection: "MEJOR VALORADAS",
              ),
              MoviesListFavsWidget(
                titleSection: "MIS FAVORITAS",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
