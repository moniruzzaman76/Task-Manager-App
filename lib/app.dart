import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/splash_screen.dart';
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light
      ),
      themeMode: ThemeMode.light
    );
  }
}