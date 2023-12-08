import 'dart:developer';

import '../../core/localization/generated/l10n.dart';
import '../../core/utils/network/api_exception.dart';
import 'app_settings_exception.dart';
import 'user_exception.dart';

extension ExceptionHandler on Exception {
  void logException(StackTrace stackTrace) {
    log('Error caught', stackTrace: stackTrace);
  }
}

extension UserExceptionHandler on UserException {
  String localizedMessage(Lang lang) {
    return switch (this) {
      UserLogoutFailed() => lang.userLogoutError,
      UserLoginFailed() => lang.userLoginError,
      UserRefreshTokenFailed() => lang.refreshTokenError,
      UserInitializationFailed() => lang.userInitError,
      UserDeletionFailed() => lang.userDeletionError,
      UserSaveFailed() => lang.userSavingError,
    };
  }
}

extension AppSettingExceptionHandler on AppSettingsException {
  String localizedMessage(Lang lang) {
    return switch (this) {
      ThemeSaveFailure() => lang.themeSaveError,
      LocalizationSaveFailure() => lang.localizationSaveError,
    };
  }
}

extension ApiExceptionHandler on ApiException {
  String localizedMessage(Lang lang) {
    return switch (this) {
      ApiConnectTimeout() => lang.connectionTimeoutError,
      ApiSendTimeout() => lang.weakInternetUpError,
      ApiReceiveTimeout() => lang.weakInternetDownError,
      ApiBadCertificates() => lang.badSecurityError,
      ApiBadResponse() => lang.badResponseError,
      ApiCancelRequest() => lang.canceledRequestError,
      ApiBadConnection() => lang.badConnectionError,
      ApiUnknownException() => lang.unknownNetworkError,
    };
  }
}
