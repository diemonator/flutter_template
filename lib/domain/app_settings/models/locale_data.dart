class LocaleData {
  const LocaleData({
    required this.languageCode,
    this.scriptCode,
    this.countryCode,
  });

  final String languageCode;
  final String? scriptCode;
  final String? countryCode;
}
