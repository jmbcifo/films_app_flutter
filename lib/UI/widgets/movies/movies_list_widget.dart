import 'package:films_app_flutter/UI/utils/urls_db.dart';
import 'package:films_app_flutter/UI/widgets/movies/item_movie_widget.dart';
import 'package:films_app_flutter/structure/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
        init: MoviesController(),
        builder: (controller) {
          controller.getPopularMovies();
          return Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            height: 220,
            width: double.infinity,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "RECOMMENDED FOR YOU",
                          style: TextStyle(
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
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          controller.popularMovies.value.results?.length ?? 0,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ItemMovieWidget(
                            title: controller.popularMovies.value
                                    .results?[index].originalTitle ??
                                '',
                            src: urlImage(controller.popularMovies.value
                                .results![index].posterPath!),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
