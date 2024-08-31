import 'package:jatitrans_app/Core/Services/Model/StatusModelResponse.dart';

import 'package:json_annotation/json_annotation.dart';

part 'BaseModelResponse.g.dart';

@JsonSerializable()
class BaseModelResponse {
  StatusModelResponse? status;
  dynamic data;

  BaseModelResponse({
    this.status,
    this.data,
  });

  factory BaseModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelResponseToJson(this);
}
