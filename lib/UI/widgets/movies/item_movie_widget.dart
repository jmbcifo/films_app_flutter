import 'package:films_app_flutter/UI/pages/details_page.dart';
import 'package:films_app_flutter/UI/routes/app_routes.dart';
import 'package:films_app_flutter/UI/themes/colors_theme.dart';
import 'package:films_app_flutter/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemMovieWidget extends StatelessWidget {
  final Movie movie;
  final String src;
  const ItemMovieWidget({
    Key? key,
    required this.movie,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navegación hacia otra página
        //Get.toNamed(Routes.DETAILS);
        Get.to(
          DetailsPage(
            src: src,
            movie: movie,
          ),
        );
      },
      child: SizedBox(
        width: 100,
        child: Card(
          elevation: 2,
          color: AppColors.darkBackground,
          //Hace referencia al tipo de borde de la Card
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(children: [
            //Recortamos los sobrantes de la imagen
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              //Rescatamos la imagen desde una url
              child: Image.network(
                src,
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              //Alineamos en donde necesitemos el widget
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  movie.originalTitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
