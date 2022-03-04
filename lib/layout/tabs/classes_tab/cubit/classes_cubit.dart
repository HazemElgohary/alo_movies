import 'dart:convert';
import 'dart:developer';

import 'package:alo_movies/models/classes_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'classes_state.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit() : super(ClassesInitial()){
    getClassesData();
  }

  final classesModel = <ClassesModel>[];

  Future<void> getClassesData() async {
    classesModel.clear();
    emit(ClassesLoading());
    try {
      final String response =
          await rootBundle.loadString('assets/back_end/api.json');
      final dataParse = await json.decode(response);
      (dataParse['classes'] as List).map(
        (e) => classesModel.add(
          ClassesModel.fromJson(e as Map<String, dynamic>),
        ),
      ).toList();
      emit(ClassesLoaded(classesModel));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ClassesCantLoad(e.toString()));
    }
  }
}
