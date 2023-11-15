import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_type.dart';

part 'user_data.freezed.dart';

part 'user_data.g.dart';

@freezed
class UserData with _$UserData, EquatableMixin {
  const factory UserData({
    required final String email,
    required final String pass,
    required final String token,
    required final String userType,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);

  const UserData._();

  factory UserData.empty() => _UserData(
        email: '',
        pass: '',
        token: '',
        userType: UserType.guest.name,
      );

  UserType get userTypeEnum => UserType.values.byName(userType);

  @override
  List<Object?> get props => [email, pass, token, userType];
}
