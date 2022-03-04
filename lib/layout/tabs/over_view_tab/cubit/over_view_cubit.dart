import 'dart:convert';
import 'dart:developer';

import 'package:alo_movies/models/over_view_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'over_view_state.dart';

class OverViewCubit extends Cubit<OverViewState> {
  OverViewCubit() : super(OverViewInitial()) {
    getOverViewData();
  }
  Future<void> getOverViewData()async{
    emit(OverViewLoading());
    try{
      final String response = await rootBundle.loadString('assets/back_end/api.json');
      final dataParse = await json.decode(response);

      emit(OverViewLoaded(OverViewModel.fromJson(dataParse)));
    }catch(e,st){
      log(e.toString());
      log(st.toString());
      emit(OverViewCantLoad(e.toString()));
    }
  }
}
