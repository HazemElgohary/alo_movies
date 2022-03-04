import 'package:alo_movies/layout/cubit/home_cubit.dart';
import 'package:alo_movies/shared/components/tab_bar/tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/video/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is HomeLoading){
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if(state is HomeLoaded){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.4,
                        child: Image.asset(
                          state.homeModel.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 10,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    state.homeModel.seriesName.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text(
                    state.homeModel.coachName,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  SizedBox(
                      height: size.height * .8,
                      child: const TabViewItem()),
                ],
              ),
            );
          }
          if(state is HomeCantLoad){
            return Center(child: Text(state.msg));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
