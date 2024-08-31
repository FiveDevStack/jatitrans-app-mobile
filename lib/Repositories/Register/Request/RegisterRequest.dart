import 'package:json_annotation/json_annotation.dart';

part 'RegisterRequest.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? email;
  String? fullName;
  String? password;

  RegisterRequest({
    this.email,
    this.fullName,
    this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
