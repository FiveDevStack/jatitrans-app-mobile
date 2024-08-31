import 'package:json_annotation/json_annotation.dart';

part 'StatusModelResponse.g.dart';

@JsonSerializable()
class StatusModelResponse {
  int? code;
  String? message;

  StatusModelResponse({
    this.code,
    this.message,
  });

  factory StatusModelResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelResponseToJson(this);
}
