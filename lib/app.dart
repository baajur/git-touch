import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/home.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    switch (theme.theme) {
      case AppThemeType.cupertino:
        return CupertinoApp(
          theme: CupertinoThemeData(brightness: theme.brightness),
          home: Home(),
        );
      default:
        return MaterialApp(
          theme: ThemeData(
            brightness: theme.brightness,
            primaryColor:
                theme.brightness == Brightness.dark ? null : Colors.white,
            accentColor: theme.paletteOf(context).primary,
            scaffoldBackgroundColor: theme.paletteOf(context).background,
          ),
          home: Home(),
        );
    }
  }
}