import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final String? src;
  final String? title;
  const DetailsPage({
    Key? key,
    this.src,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.back();
      }),
      body: Column(children: [
        Flexible(
          child: Stack(
            children: [
              Image.network(
                src!,
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Text(title!),
            ],
          ),
        )
      ]),
    );
  }
}
