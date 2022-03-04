import 'package:equatable/equatable.dart';

class CommunityModel extends Equatable {
  final String image;
  final String time;
  final String day;
  final String name;
  final String className;
  final String series;

  const CommunityModel({
    required this.image,
    required this.time,
    required this.day,
    required this.name,
    required this.className,
    required this.series,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      image: json['image'],
      time: json['time'],
      day: json['day'],
      name: json['name'],
      className: json['class'],
      series: json['series'],
    );
  }

  @override
  List<Object?> get props => [
        image,
        className,
        series,
        time,
        name,
        day,
      ];
}
