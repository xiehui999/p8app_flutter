import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:p8app_flutter/lang/localizations.dart';
import 'package:p8app_flutter/pages/splash_page.dart';
import 'package:p8app_flutter/setting/setting_options.dart';
import 'package:p8app_flutter/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  Map<String, WidgetBuilder> _buildRoutes() {
//    return new Map<String, WidgetBuilder>.fromIterable([],
//        key: (dynamic item) => '${item.routeName}',
//        value: (dynamic item) => item.buildRoute);
//  }

  Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Navigator.defaultRouteName: (context) => new SplashPage(),
  };

  @override
  Widget build(BuildContext context) {
//    _routes.addAll(_buildRoutes());
    return ModelBinding(
      initialModel: SettingOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: -1,
        locale: null,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            themeMode: SettingOptions.of(context).themeMode,
            darkTheme: darkTheme,
            routes: _routes,
            localizationsDelegates: [
              ...CustomLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            locale: SettingOptions.of(context).locale,
            supportedLocales: CustomLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
