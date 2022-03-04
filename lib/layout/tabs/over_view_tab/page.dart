import 'package:alo_movies/layout/tabs/over_view_tab/cubit/over_view_cubit.dart';
import 'package:alo_movies/shared/components/coach_item/view.dart';
import 'package:alo_movies/shared/components/video/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverViewTab extends StatelessWidget {
  const OverViewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<OverViewCubit, OverViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OverViewLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is OverViewLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'about the series'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence',
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                VideoItem(video: state.overViewModel.video),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    title: CoachItem(
                      name: state.overViewModel.coaches[index].name,
                      job: state.overViewModel.coaches[index].job,
                    ),
                    subtitle: const Text(
                      'There are many variations of passages '
                      'of Lorem Ipsum available, but the majority'
                      ' have suffered alteration in some form, by '
                      'injected humour, or randomised words which '
                      'dont look even slightly believable. If you'
                      ' are going to use a passage of Lorem Ipsum',
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: state.overViewModel.coaches.length,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          );
        }
        if (state is OverViewCantLoad) {
          return Center(child: Text(state.msg));
        }
        return const SizedBox();
      },
    );
  }
}
