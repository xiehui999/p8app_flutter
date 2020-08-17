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

  @override
  String get tabHot => '最热';

  @override
  String get tabNew => '最新';

  @override
  String get test => '测试';

  @override
  String get jump => '跳转';

  @override
  String get refresh => '下拉刷新';

  @override
  String get dialogCanncel => '取消';

  @override
  String get dialogConfirm => '确定';

  @override
  String get dialogTitle => '标题';

  @override
  String get selected => '页面返回出传递参数:';

  @override
  String get tip => "页面接收的参数：";
}
