import 'package:flutter/material.dart';
import 'package:news_app/ui/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      fontFamily: 'Poppins'
    ), home: SplashScreen());
  }
}
