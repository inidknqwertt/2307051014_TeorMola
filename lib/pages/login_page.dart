import 'package:flutter/material.dart';
import 'dashboard_page.dart';

/// Halaman utama login aplikasi CafféLux.
/// Menggunakan konsep tampilan elegan dengan warna netral dan grid layout tengah.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangani input teks username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Fungsi untuk memvalidasi input dan berpindah ke halaman Dashboard
  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // 🔹 Validasi input sederhana
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Isi username dan password terlebih dahulu.")),
      );
      return;
    }

    // 🔹 Navigasi ke halaman Dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DashboardPage(username: username)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔸 Warna latar belakang utama (cream lembut)
      backgroundColor: const Color(0xFFF5EFE6),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  // 🔹 Membatasi lebar maksimal agar tetap proporsional di layar besar
                  constraints: const BoxConstraints(maxWidth: 400),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ====================== LOGO & BRANDING ======================
                      Column(
                        children: [
                          // Logo aplikasi dari assets
                          Image.asset(
                            "assets/images/flutter_logoo.png",
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),

                          // Nama brand aplikasi
                          const Text(
                            "CafféLux",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B2E2A),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),

                      // ====================== CARD FORM LOGIN ======================
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            // 🔹 Bayangan lembut agar tampilan tampak elegan
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Judul kecil di bagian atas card
                            const Text(
                              "Masuk ke akunmu",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3B2E2A),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),

                            // ====================== INPUT USERNAME ======================
                            TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: "Username",
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF3B2E2A),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFDFCFB),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // ====================== INPUT PASSWORD ======================
                            TextField(
                              controller: _passwordController,
                              obscureText: true, // Menyembunyikan teks password
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF3B2E2A),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFDFCFB),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            // ====================== TOMBOL LOGIN ======================
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3B2E2A), // Espresso brown
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 3,
                                ),
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // ====================== FOOTER QUOTE ======================
                      const Text(
                        "Nikmati hari dengan secangkir kopi ☕",
                        style: TextStyle(
                          color: Color(0xFF6B4F3B),
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
