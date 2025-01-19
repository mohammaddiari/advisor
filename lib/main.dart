import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/core/services/theme_service.dart';
import 'application/pages/advice/advice_page.dart';
import 'theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (
      BuildContext context,
      ThemeService themeService,
      Widget? child,
    ) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicePage(),
      );
    });
  }
}
