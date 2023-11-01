import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_type.dart';

part 'user_data.freezed.dart';

part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required final String email,
    required final String pass,
    required final String token,
    required final String userType,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);

  const UserData._();

  factory UserData.guest() => _UserData(
        email: '',
        pass: '',
        token: '',
        userType: UserType.guest.name,
      );

  UserType get userTypeEnum => UserType.values.byName(userType);
}
