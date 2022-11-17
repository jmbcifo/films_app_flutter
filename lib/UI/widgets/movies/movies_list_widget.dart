import 'package:films_app_flutter/UI/utils/urls_db.dart';
import 'package:films_app_flutter/UI/widgets/movies/item_movie_widget.dart';
import 'package:films_app_flutter/models/movie_model.dart';
import 'package:films_app_flutter/structure/controllers/movies_controller.dart';
import 'package:flutter/material.dart';

class MoviesListWidget extends StatelessWidget {
  //Importar los parametros en el constructor que necesitamos pasar de forma global
  final String titleSection;
  final List<Movie>? movies;
  const MoviesListWidget({
    Key? key,
    required this.titleSection,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 20,
      ),
      height: 220,
      width: double.infinity,
      child: Column(
        children: [
          //Los flexible nos permiten hacer la aplicación responsive
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.infinity,
              //Lista horizontal
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleSection,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        print("holaMundo");
                      },
                      child: const Text("See all"))
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child:
                //Analizar si hay o no películas y en caso de que no haya ninguna
                //ver un texto en pantalla
                (movies == null)
                    ? const Text(
                        "No hay películas",
                        style: TextStyle(color: Colors.white),
                      )
                    :

                    //El listView.builder construye un listado en función de tantos
                    //items como películas tengamos
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies?.length ?? 0,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            //Este es el Item de la película
                            child: ItemMovieWidget(
                              movie: movies?[index] ?? Movie(),
                              src: urlImage(movies![index].posterPath!),
                            ),
                          );
                        }),
                      ),
          ),
        ],
      ),
    );
  }
}
