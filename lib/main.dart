import 'package:flutter/material.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MovieStreamingApp());
}

class MovieStreamingApp extends StatelessWidget {
  const MovieStreamingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

