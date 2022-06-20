import 'user.dart';

class Org {
  String name;
  String? domain;
  String? comment;
  bool isProduction;
  List<User>? userList = [];

  Org(this.name, this.isProduction, {this.domain, this.comment, this.userList});
}
