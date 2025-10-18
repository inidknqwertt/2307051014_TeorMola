import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // 🔹 Import halaman pertama (Login Page)

/// 🔸 Titik awal eksekusi aplikasi Flutter.
/// Fungsi `main()` menjalankan widget utama yaitu `MyApp()`.
void main() {
  runApp(const MyApp());
}

/// 🔸 Widget utama aplikasi CafféLux.
/// Bertanggung jawab mengatur tema global, gaya tampilan, dan halaman awal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 🔹 Menghapus label "debug" di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // 🔹 Judul aplikasi (muncul di task manager)
      title: 'CafféLux ☕',

      // ==================== TEMA UTAMA APLIKASI ====================
      theme: ThemeData(
        // Warna dasar utama (mengatur AppBar, tombol, dsb.)
        primarySwatch: Colors.brown,

        // Warna latar belakang seluruh halaman
        scaffoldBackgroundColor: const Color(0xFFF5EFE6), // Cream elegan lembut

        // 🔹 Gaya untuk AppBar di seluruh aplikasi
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B2E2A), // Espresso Brown solid
          foregroundColor: Colors.white,       // Warna teks/icon di AppBar
          elevation: 2,                        // Bayangan halus di bawah AppBar
          centerTitle: true,                   // Judul AppBar di tengah

          // Gaya teks untuk judul AppBar
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        // 🔹 Font global agar tampilan lebih mewah dan konsisten
        fontFamily: 'Montserrat', // Pastikan sudah ditambahkan di pubspec.yaml
      ),

      // ==================== HALAMAN UTAMA ====================
      // Saat aplikasi dibuka pertama kali, yang tampil adalah LoginPage
      home: const LoginPage(),
    );
  }
}
