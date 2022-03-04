import 'package:equatable/equatable.dart';

class OverViewModel extends Equatable {
  final String video;
  final List<Coach> coaches;

  const OverViewModel({
    required this.video,
    required this.coaches,
  });

  factory OverViewModel.fromJson(Map<String, dynamic> json) {
    return OverViewModel(
      video: json['video'],
      coaches: (json['coaches'] as List)
          .map(
            (e) => Coach.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [video,coaches,];
}

class Coach extends Equatable {
  final String name;
  final String job;
  final String image;

  const Coach({
    required this.name,
    required this.job,
    required this.image,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      name: json['name'],
      job: json['jop'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [image, name, job];
}
