import 'dart:convert';
import 'dart:developer';

import 'package:alo_movies/models/community_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial()){
    getCommunityData();
  }

  final posts = <CommunityModel>[];
  Future<void> getCommunityData() async {
    posts.clear();
    emit(CommunityLoading());
    try {
      final String response =
      await rootBundle.loadString('assets/back_end/api.json');
      final dataParse = await json.decode(response);
      (dataParse['posts'] as List).map(
            (e) => posts.add(
          CommunityModel.fromJson(e as Map<String, dynamic>),
        ),
      ).toList();

      emit(CommunityLoaded(posts));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CommunityCantLoad(e.toString()));
    }
  }
}
