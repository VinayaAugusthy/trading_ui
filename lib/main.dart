import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/shell/app_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Trading Community',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.transparent,
        colorScheme: const ColorScheme.dark(primary: AppColors.primaryAccent),
      ),
      home: const AppShell(),
    );
  }
}
