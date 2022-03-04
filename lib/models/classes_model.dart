import 'package:equatable/equatable.dart';

class ClassesModel extends Equatable {
  final String video;
  final String time;
  final String day;
  final String name;

  const ClassesModel({
    required this.video,
    required this.time,
    required this.day,
    required this.name,
  });

  factory ClassesModel.fromJson(Map<String, dynamic> json) {
    return ClassesModel(
      video: json['class_video'],
      time: json['video_time'],
      day: json['class_day_number'],
      name: json['class_name'],
    );
  }

  @override
  List<Object?> get props => [video,time,name,day];
}
