part of 'classes_cubit.dart';

@immutable
abstract class ClassesState {}

class ClassesInitial extends ClassesState {}
class ClassesLoading extends ClassesState {}
class ClassesLoaded extends ClassesState {
  final List<ClassesModel> classesModel;

  ClassesLoaded(this.classesModel);
}
class ClassesCantLoad extends ClassesState {
  final String msg;

  ClassesCantLoad(this.msg);
}
