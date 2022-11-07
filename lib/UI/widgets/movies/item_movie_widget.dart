import 'package:flutter/material.dart';

class ItemMovieWidget extends StatelessWidget {
  final String title;
  final String src;
  const ItemMovieWidget({
    Key? key,
    required this.title,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 2,
        color: Color.fromARGB(255, 39, 48, 65),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            child: Image.network(
              src,
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
