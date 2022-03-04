import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String image;
  final String seriesName;
  final String coachName;

  const HomeModel({
    required this.image,
    required this.seriesName,
    required this.coachName,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      image: json['cover_photo'],
      seriesName: json['series_name'],
      coachName: json['coach_name'],
    );
  }

  @override
  List<Object?> get props => [
    image,
    seriesName,
    coachName
  ];
}
