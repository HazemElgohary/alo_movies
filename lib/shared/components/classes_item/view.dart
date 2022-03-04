import 'package:alo_movies/models/classes_model.dart';
import 'package:flutter/material.dart';

import '../video/video_player.dart';

class ClassesItem extends StatelessWidget {
  final ClassesModel classesModel;
  final int number;

  const ClassesItem({
    Key? key,
    required this.number,
    required this.classesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            VideoItem(video: classesModel.video),
            Container(
              height: 30,
              width: 30,
              color: Colors.white,
              child: Center(
                  child: Text(
                number.toString(),
                style: const TextStyle(color: Colors.black),
              )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Day ${classesModel.day} :',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              classesModel.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.width * .8,
          child: const Text('There are many'
              ' variations of passages of Lorem Ipsum '
              'available, but the majority '),
        ),
      ],
    );
  }
}
