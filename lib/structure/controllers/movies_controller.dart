import 'package:films_app_flutter/models/movie_model.dart';
import 'package:films_app_flutter/models/popular_movies_model.dart';
import 'package:films_app_flutter/services/movies_repository.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  /*
  Rx<Future<PopularMovies>> popularMovies =
      MoviesRepository().popularMovies().obs;
  */
  //Esta es una variable reactiva del objeto PopularMovies
  Rx<PopularMovies> popularMovies = PopularMovies().obs;
  //Solución 2
  //Rx<Movie> newMovie = Movie().obs;

  //Esta variable reactiva es para la lista de peliculas mejor valoradas
  RxList<Movie> mostPopularMovies = <Movie>[].obs;

  RxList<Movie> favMovies = <Movie>[].obs;

  AuthController authController = Get.find();

  Future<void> getPopularMovies() async {
    final PopularMovies newPopularMovies =
        await MoviesRepository().popularMovies();
    print(popularMovies.value);
    popularMovies.value = newPopularMovies;
  }

  Future<void> getMostPopularMovies() async {
    final PopularMovies newPopularMovies =
        await MoviesRepository().popularMovies();
    List<Movie> newListMovie = newPopularMovies.results!;
    //El metodo sort ordena Y RETORNA la lista en función del parametro
    // en este caso voteAverange
    newListMovie.sort((a, b) => b.voteAverage!.compareTo(a.voteAverage!));
    print(newListMovie);

    mostPopularMovies.value = newListMovie;
  }

  Future<void> getFavMovies() async {
    final PopularMovies newPopularMovies =
        await MoviesRepository().popularMovies();
    authController.userDb.refresh();
    for (var i = 0; i < authController.userDb.value!.uidsFavs!.length; i++) {
      for (var element in newPopularMovies.results!) {
        if (authController.userDb.value!.uidsFavs![i] != element.id) {
          favMovies.add(element);
        }
      }
    }

    print(favMovies);

    favMovies.refresh();
  }
}
