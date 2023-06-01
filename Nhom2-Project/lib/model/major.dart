import 'package:json_annotation/json_annotation.dart';

part 'major.g.dart';

@JsonSerializable()
class Major {
  int id;
  String name;
  Major({this.id = 0, required this.name});

  factory Major.fromJson(Map<String, dynamic> json) => _$MajorFromJson(json);
  Map<String, dynamic> toJson() => _$MajorToJson(this);
}
