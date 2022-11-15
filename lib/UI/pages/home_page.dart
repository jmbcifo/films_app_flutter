import 'package:films_app_flutter/UI/routes/app_routes.dart';
import 'package:films_app_flutter/UI/utils/images/pick_image_utils.dart';
import 'package:films_app_flutter/UI/widgets/home/section_films_widget.dart';
import 'package:films_app_flutter/UI/widgets/home/section_search_film_widget.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "1",
              onPressed: () {
                authController.signOut();
              }),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
              heroTag: "2",
              child: Icon(Icons.edit),
              onPressed: () {
                // llamar a la función de la cámara
                // PickImageUtils().showPicker(context);

                //Navegación hacia la pantalla de editar
                Get.toNamed(Routes.EDITUSER);
              })
        ],
      ),
      appBar: AppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(91, 161, 210, 1),
      body: Column(
        children: const [
          Flexible(
            flex: 1,
            child: SectionSearchFilmWidget(
              text: 'Hello, what do you want to watch?',
            ),
          ),
          Flexible(
            flex: 2,
            child: SectionFilmsWidget(),
          )
        ],
      ),
    );
  }
}
