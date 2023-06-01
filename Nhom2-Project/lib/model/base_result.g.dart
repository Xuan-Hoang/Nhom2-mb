// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResult<T> _$BaseResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResult<T>(
      errorCode: json['errorCode'] as int,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResultToJson<T>(
  BaseResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
