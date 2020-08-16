import 'package:p8app_flutter/lang/localizations.dart';

class LocalizationZh extends CustomLocalizations {
  LocalizationZh([String locale = 'zh']) : super(locale);

  @override
  String get dark => "深夜模式";

  @override
  String get light => "白天模式";
  @override
  String get languageEn => "英文";

  @override
  String get languageZn => "中文";

  @override
  String get appName => "示例";

  @override
  String get tabAcademy => "学院";

  @override
  String get tabDiscover => "发现";

  @override
  String get tabMain => "首页";

  @override
  String get tabMe => "我";

  @override
  String get signIn => '登录';
}
