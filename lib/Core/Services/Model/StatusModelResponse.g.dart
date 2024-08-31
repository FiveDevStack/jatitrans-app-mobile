// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StatusModelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModelResponse _$StatusModelResponseFromJson(Map<String, dynamic> json) =>
    StatusModelResponse(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StatusModelResponseToJson(
        StatusModelResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
