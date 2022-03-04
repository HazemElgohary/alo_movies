import 'package:alo_movies/layout/tabs/community_tab/cubit/community_cubit.dart';
import 'package:alo_movies/shared/components/post_item/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<CommunityCubit, CommunityState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CommunityLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is CommunityLoaded) {
          return ListView.separated(
            itemBuilder: (context, index) => SocialPostItem(
              communityModel: state.posts[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: size.height * .02,
            ),
            itemCount: state.posts.length,
          );
        }
        if (state is CommunityCantLoad) {
          return Center(child: Text(state.msg));
        }
        return const SizedBox();
      },
    );
  }
}
