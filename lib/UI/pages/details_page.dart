import 'package:films_app_flutter/UI/themes/colors_theme.dart';
import 'package:films_app_flutter/models/movie_model.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:films_app_flutter/structure/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final String? src;
  final Movie? movie;
  const DetailsPage({
    Key? key,
    this.movie,
    this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    MoviesController moviesController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Stack(
                  children: [
                    Image.network(
                      src!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          IconButton(
                            icon: Obx(
                              () => (authController.userDb.value!.uidsFavs!
                                      .contains(movie!.id))
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.yellow,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                            ),
                            onPressed: () {
                              authController.addFavFilm(movie!);

                              moviesController.getFavMovies();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie!.originalTitle!,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie!.overview!,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
