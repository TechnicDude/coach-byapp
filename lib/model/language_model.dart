class LanguageModel {
  final String flag;
  final String name;
  final String languageCode;

  LanguageModel(
    this.flag,
    this.name,
    this.languageCode,
  );

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      // LanguageModel("🇺🇸", "English", 'en'),
      LanguageModel("Hi! I'am CoachbyApp ", "English", 'en'), // english
      LanguageModel("Hola soy CoachbyApp", "svenska", 'sv'), //swedish
    ];
  }
}
