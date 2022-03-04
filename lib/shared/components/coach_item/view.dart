import 'package:alo_movies/models/over_view_model.dart';
import 'package:flutter/material.dart';

class CoachItem extends StatelessWidget {
  final String name;
  final String job;
  final bool isPost;

  const CoachItem({
    Key? key,
    this.isPost = false,
    required this.name,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .01),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: isPost ? 25 : 35,
            backgroundImage: const AssetImage('assets/images/logo.jpg'),
          ),
          SizedBox(
            width: size.width * .06,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (isPost)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_outlined),
            ),
        ],
      ),
    );
  }
}
