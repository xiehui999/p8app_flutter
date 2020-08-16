import 'package:flutter/material.dart';
import 'package:p8app_flutter/lang/localizations.dart';
import 'package:p8app_flutter/setting/setting_options.dart';

import 'me.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
            icon: icon,
            label: title,
            activeIcon: activeIcon,
            backgroundColor: color),
        controller = new AnimationController(
            vsync: vsync, duration: kThemeAnimationDuration) {
    _animation = new CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn));
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition treansition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position:
            new Tween<Offset>(begin: const Offset(0.0, 0.02), end: Offset.zero)
                .animate(_animation),
        child: new IconTheme(
            data: new IconThemeData(color: iconColor, size: 120.0),
            child: new Semantics(
              label: 'Placeholder for $_title tab',
            )),
      ),
    );
  }
}

class _HomeTabState extends State<HomeTab>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  bool isDark = false;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    super.didChangeLocales(locale);
  }

  @override
  Widget build(BuildContext context) {
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          icon: Icon(Icons.home),
          title: CustomLocalizations.of(context).tabMain,
          color: Colors.deepPurple,
          vsync: this),
      new NavigationIconView(
          activeIcon: new CustomIcon(),
          icon: new CustomInactiveIcon(),
          title: CustomLocalizations.of(context).tabDiscover,
          color: Colors.deepOrange,
          vsync: this),
      new NavigationIconView(
          activeIcon: Icon(Icons.favorite),
          icon: Icon(Icons.favorite_border),
          title: CustomLocalizations.of(context).tabAcademy,
          color: Colors.indigo,
          vsync: this),
      new NavigationIconView(
          icon: Icon(Icons.my_library_books),
          title: CustomLocalizations.of(context).tabMe,
          color: Colors.pink,
          vsync: this)
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(() => {});
      _navigationViews[_currentIndex].controller.value = 1.0;
    }
    Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{};
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView navigationView) {
        return navigationView.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );
    final options = SettingOptions.of(context);

    ThemeData themeData = Theme.of(context);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(CustomLocalizations.of(context).appName),
          actions: [
            new PopupMenuButton<ThemeMode>(
                onSelected: (ThemeMode value) {
                  SettingOptions.update(
                      context, options.copyWith(themeMode: value));
                },
                icon: Icon(Icons.settings_system_daydream),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<ThemeMode>>[
                    PopupMenuItem<ThemeMode>(
                      value: ThemeMode.light,
                      child: new Text(CustomLocalizations.of(context).light),
                    ),
                    PopupMenuItem<ThemeMode>(
                      value: ThemeMode.dark,
                      child: new Text(CustomLocalizations.of(context).dark),
                    )
                  ];
                }),
            new PopupMenuButton<Locale>(
                onSelected: (Locale value) {
                  SettingOptions.update(
                    context,
                    options.copyWith(locale: value),
                  );
                },
                icon: Icon(Icons.language_sharp),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<Locale>>[
                    PopupMenuItem<Locale>(
                      value: Locale('en', 'CH'),
                      child:
                          new Text(CustomLocalizations.of(context).languageEn),
                    ),
                    PopupMenuItem<Locale>(
                      value: Locale('zh', 'CH'),
                      child:
                          new Text(CustomLocalizations.of(context).languageZn),
                    )
                  ];
                }),
            new PopupMenuButton<BottomNavigationBarType>(
                onSelected: (BottomNavigationBarType value) {
              setState(() {
                _type = value;
              });
            }, itemBuilder: (BuildContext context) {
              return <PopupMenuItem<BottomNavigationBarType>>[
                PopupMenuItem<BottomNavigationBarType>(
                  value: BottomNavigationBarType.fixed,
                  child: new Text('Fixed'),
                ),
                PopupMenuItem<BottomNavigationBarType>(
                  value: BottomNavigationBarType.shifting,
                  child: new Text('Shifting'),
                )
              ];
            })
          ],
        ),
        body: IndexedStack(
          children: [
            Center(
              child: Container(
                color: isDark ? Colors.white : Color(0xff202124),
                child: Text('1111'),
              ),
            ),
            Center(
              child: Text('1111'),
            ),
            Center(
              child: Text('1111'),
            ),
            Center(
              child: Me(),
            )
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconThemeData = IconTheme.of(context);
    return Container(
      margin: EdgeInsets.all(4.0),
      width: iconThemeData.size - 8.0,
      height: iconThemeData.size - 8.0,
      color: iconThemeData.color,
    );
  }
}

class CustomInactiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return new Container(
        margin: EdgeInsets.all(4.0),
        width: iconTheme.size - 8.0,
        height: iconTheme.size - 8.0,
        decoration: new BoxDecoration(
          border: new Border.all(color: iconTheme.color, width: 2.0),
        ));
  }
}
