import 'package:json_annotation/json_annotation.dart';

part 'LoginDM.g.dart';

@JsonSerializable()
class LoginDM {
  String? email;
  String? fullName;

  LoginDM({
    this.email,
    this.fullName,
  });

  factory LoginDM.fromJson(Map<String, dynamic> json) =>
      _$LoginDMFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDMToJson(this);
}
