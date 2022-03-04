import 'dart:convert';
import 'dart:developer';

import 'package:alo_movies/models/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getTrainingSeriesData();
  }

  Future<void> getTrainingSeriesData()async{
    emit(HomeLoading());
    try{
      final String response = await rootBundle.loadString('assets/back_end/api.json');
      final dataParse = await json.decode(response);

      emit(HomeLoaded(HomeModel.fromJson(dataParse)));
    }catch(e,st){
      log(e.toString());
      log(st.toString());
      emit(HomeCantLoad(e.toString()));
    }
  }
}
