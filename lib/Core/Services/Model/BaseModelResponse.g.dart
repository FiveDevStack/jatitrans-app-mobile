// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseModelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModelResponse _$BaseModelResponseFromJson(Map<String, dynamic> json) =>
    BaseModelResponse(
      status: json['status'] == null
          ? null
          : StatusModelResponse.fromJson(
              json['status'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$BaseModelResponseToJson(BaseModelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
