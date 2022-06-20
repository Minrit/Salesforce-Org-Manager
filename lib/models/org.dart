import 'user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'org.g.dart';

@JsonSerializable()
class Org {
  String name;
  String? domain;
  String? comment;
  bool isProduction;
  List<User>? userList = [];

  Org(this.name, this.isProduction, {this.domain, this.comment, this.userList});
  factory Org.fromJson(Map<String, dynamic> json) => _$OrgFromJson(json);
  Map<String, dynamic> toJson() => _$OrgToJson(this);

}
