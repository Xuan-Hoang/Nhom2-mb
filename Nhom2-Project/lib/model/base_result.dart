import 'package:json_annotation/json_annotation.dart';
part 'base_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResult<T> {
  int errorCode;
  String? message;
  T? data;
  BaseResult({required this.errorCode, this.data, this.message});
  factory BaseResult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResultFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResultToJson(this, toJsonT);
}
