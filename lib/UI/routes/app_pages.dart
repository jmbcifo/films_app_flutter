import 'package:films_app_flutter/UI/pages/auth/login_page.dart';
import 'package:films_app_flutter/UI/pages/auth/register_page.dart';
import 'package:films_app_flutter/UI/pages/details_page.dart';
import 'package:films_app_flutter/UI/pages/home_page.dart';
import 'package:films_app_flutter/UI/pages/loading_page.dart';
import 'package:films_app_flutter/UI/routes/app_routes.dart';
import 'package:films_app_flutter/structure/bindings/auth_binding.dart';
import 'package:films_app_flutter/structure/bindings/movies_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => const DetailsPage(
        src: null,
        movie: null,
      ),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => const LoadingPage(),
    )
  ];
}
