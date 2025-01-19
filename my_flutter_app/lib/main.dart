import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the splash screen
import 'home_page.dart'; // Import the home page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}
