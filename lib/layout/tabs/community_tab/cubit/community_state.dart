part of 'community_cubit.dart';

@immutable
abstract class CommunityState {}

class CommunityInitial extends CommunityState {}
class CommunityLoading extends CommunityState {}
class CommunityLoaded extends CommunityState {
  final List<CommunityModel> posts;

  CommunityLoaded(this.posts);
}
class CommunityCantLoad extends CommunityState {
  final String msg;

  CommunityCantLoad(this.msg);
}
