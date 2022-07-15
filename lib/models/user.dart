import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User {
  late String username;
  late String password;
  late String? persona;
  late String? securityToken;

  User(this.username, this.password, {this.persona, this.securityToken});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
