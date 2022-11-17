import 'package:films_app_flutter/UI/routes/app_pages.dart';
import 'package:films_app_flutter/UI/routes/app_routes.dart';
import 'package:films_app_flutter/firebase_options.dart';
import 'package:films_app_flutter/structure/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Device Orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.LOADING,
      initialBinding: BindingsBuilder(() {
        Get.put<AuthController>(AuthController());
      }),
    );
  }
}
