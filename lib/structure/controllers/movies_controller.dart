import 'package:films_app_flutter/models/movie_model.dart';
import 'package:films_app_flutter/models/popular_movies_model.dart';
import 'package:films_app_flutter/services/movies_repository.dart';
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
}
