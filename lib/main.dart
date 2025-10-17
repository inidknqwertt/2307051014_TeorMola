import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CafféLux ☕',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFF5EFE6), // warna cream elegan
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B2E2A), // espresso brown solid
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        fontFamily: 'Montserrat', // optional: font elegan
      ),
      home: const LoginPage(), // halaman muncul pertama
    );
  }
}
