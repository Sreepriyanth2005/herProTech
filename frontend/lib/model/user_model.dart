import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? userName;
  final String? email;
  final String? phoneNumber;

  const UserModel({
    this.userName,
    this.email,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [userName, email, phoneNumber];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
