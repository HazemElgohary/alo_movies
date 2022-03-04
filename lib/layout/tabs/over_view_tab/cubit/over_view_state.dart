part of 'over_view_cubit.dart';

@immutable
abstract class OverViewState {}

class OverViewInitial extends OverViewState {}
class OverViewLoading extends OverViewState {}
class OverViewLoaded extends OverViewState {
  final OverViewModel overViewModel;

  OverViewLoaded(this.overViewModel);
}
class OverViewCantLoad extends OverViewState {
  final String msg;

  OverViewCantLoad(this.msg);
}
