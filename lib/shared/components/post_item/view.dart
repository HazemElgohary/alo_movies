import 'package:alo_movies/models/community_model.dart';
import 'package:alo_movies/shared/components/coach_item/view.dart';
import 'package:flutter/material.dart';

class SocialPostItem extends StatelessWidget {
  final CommunityModel communityModel;
  const SocialPostItem({Key? key,required this.communityModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Column(
            children: [
              CoachItem(isPost: true,job: communityModel.name,name: communityModel.time,),
              Wrap(
                children: [
                  Text(
                    'Day ${communityModel.day} :',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    communityModel.className.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    'for ${communityModel.time}',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    communityModel.series.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.favorite_border),
                  ),
                  Text('Be the first to like this'),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Container(
          height: 50,
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Write a Comment',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
      ],
    );
  }
}
