import 'package:p8app_flutter/lang/localizations.dart';

class LocalizationEn extends CustomLocalizations {
  LocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get dark => 'Dark';

  @override
  String get light => "Light";
  @override
  String get languageEn => "En";

  @override
  String get languageZn => "Zn";

  @override
  String get appName => "Demo";

  @override
  String get tabAcademy => "Academy";

  @override
  String get tabDiscover => 'Discover';

  @override
  String get tabMain => 'Home';

  @override
  String get tabMe => 'Me';

  @override
  String get signIn => "Sign in";
}
