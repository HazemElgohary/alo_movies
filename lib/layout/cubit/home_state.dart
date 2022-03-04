part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final HomeModel homeModel;

  HomeLoaded(this.homeModel);
}
class HomeCantLoad extends HomeState {
  final String msg;

  HomeCantLoad(this.msg);
}
