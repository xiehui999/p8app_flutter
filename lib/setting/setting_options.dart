import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SettingOptions {
  const SettingOptions({
    this.themeMode,
    double textScaleFactor,
    Locale locale,
    this.timeDilation,
    this.platform,
    this.isTestMode,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;
  final ThemeMode themeMode;
  final double _textScaleFactor;
  final Locale _locale;
  final double timeDilation;
  final TargetPlatform platform;
  final bool isTestMode; // True for integration tests.
  SettingOptions copyWith({
    ThemeMode themeMode,
    double textScaleFactor,
    Locale locale,
    double timeDilation,
    TargetPlatform platform,
    bool isTestMode,
  }) {
    return SettingOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      locale: locale ?? this.locale,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
      isTestMode: isTestMode ?? this.isTestMode,
    );
  }

  Locale get locale => _locale ?? const Locale('zh', 'CN');

  @override
  bool operator ==(Object other) =>
      other is SettingOptions &&
      themeMode == other.themeMode &&
      _textScaleFactor == other._textScaleFactor &&
      locale == other.locale &&
      timeDilation == other.timeDilation &&
      platform == other.platform &&
      isTestMode == other.isTestMode;

  @override
  int get hashCode => hashValues(
        themeMode,
        _textScaleFactor,
        locale,
        timeDilation,
        platform,
        isTestMode,
      );

  static SettingOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, SettingOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingScope extends InheritedWidget {
  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    Widget child,
  })  : assert(modelBindingState != null),
        super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  ModelBinding({
    Key key,
    this.initialModel = const SettingOptions(),
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final SettingOptions initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  SettingOptions currentModel;
  Timer _timeDilationTimer;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    _timeDilationTimer?.cancel();
    _timeDilationTimer = null;
    super.dispose();
  }

  void handleTimeDilation(SettingOptions newModel) {
    if (currentModel.timeDilation != newModel.timeDilation) {
      _timeDilationTimer?.cancel();
      _timeDilationTimer = null;
      if (newModel.timeDilation > 1) {
        // We delay the time dilation change long enough that the user can see
        // that UI has started reacting and then we slam on the brakes so that
        // they see that the time is in fact now dilated.
        _timeDilationTimer = Timer(const Duration(milliseconds: 150), () {});
      } else {
        timeDilation = newModel.timeDilation;
      }
    }
  }

  void updateModel(SettingOptions newModel) {
    if (newModel != currentModel) {
      handleTimeDilation(newModel);
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
