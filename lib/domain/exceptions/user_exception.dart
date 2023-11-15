sealed class UserException implements Exception {
  const UserException();
}

final class UserDeletionFailed extends UserException {
  const UserDeletionFailed();
}

final class UserSaveFailed extends UserException {
  const UserSaveFailed();
}

final class UserInitializationFailed extends UserException {
  const UserInitializationFailed();
}

final class UserLoginFailed extends UserException {
  const UserLoginFailed();
}

final class UserLogoutFailed extends UserException {
  const UserLogoutFailed();
}

final class UserRefreshTokenFailed extends UserException {
  const UserRefreshTokenFailed();
}
