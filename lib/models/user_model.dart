import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  String? name;
  final String email;
  String? urlImage;
  final bool isAdmin;

  UserModel({
    required this.uid,
    this.urlImage,
    this.name,
    required this.email,
    this.isAdmin = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
