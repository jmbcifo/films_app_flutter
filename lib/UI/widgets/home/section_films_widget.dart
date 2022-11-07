import 'package:films_app_flutter/UI/widgets/movies/movies_list_widget.dart';
import 'package:flutter/material.dart';

class SectionFilmsWidget extends StatelessWidget {
  const SectionFilmsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 39, 48, 65),
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
              MoviesListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
