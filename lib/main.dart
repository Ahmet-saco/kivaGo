import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}

/// Main app widget with theme configuration
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindtrip AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SignUpPage(),
    );
  }
}
