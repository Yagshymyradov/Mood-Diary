import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mood_diary/utils/navigation.dart';
import 'package:mood_diary/utils/theme.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MoodDairyApp());
}

class MoodDairyApp extends StatelessWidget {
  const MoodDairyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.appLightTheme,
      supportedLocales: const [Locale('ru')],
      localizationsDelegates: <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('ru'),
      home: const HomeScreen(),
    );
  }
}
