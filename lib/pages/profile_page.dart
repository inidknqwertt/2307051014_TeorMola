import 'package:flutter/material.dart';
import 'login_page.dart'; // 🔹 Mengimpor halaman Login untuk digunakan saat logout

/// Widget `ProfilePage` menampilkan informasi profil pengguna
/// seperti nama, email, lokasi, serta tombol logout.
/// Desain dibuat elegan dengan tema warna kopi dan nuansa mewah.
class ProfilePage extends StatelessWidget {
  final String username; // 🔹 Menyimpan nama pengguna yang dikirim dari halaman Dashboard

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 🔹 Latar belakang dengan gradasi lembut (cream ke coklat muda)
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8EDE3), Color(0xFFD7B19D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),

      // 🔹 Konten utama halaman profil
      child: Center(
        child: Card(
          elevation: 10, // Memberi efek timbul elegan
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          color: Colors.white.withOpacity(0.95),
          shadowColor: Colors.brown.withOpacity(0.4),

          // 🔹 Isi dalam card profil
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ======================== FOTO PROFIL ========================
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.png'), // Gambar dari assets
                ),
                const SizedBox(height: 20),

                // ======================== NAMA PENGGUNA ========================
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F4E37),
                  ),
                ),
                const SizedBox(height: 6),

                // ======================== DESKRIPSI SINGKAT ========================
                const Text(
                  "Luxury Coffee Enthusiast ☕",
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                ),
                const SizedBox(height: 24),

                // ======================== EMAIL ========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.email_outlined, color: Colors.brown),
                    SizedBox(width: 8),
                    Text(
                      "nldksa615@gmail.com",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ======================== LOKASI ========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on_outlined, color: Colors.brown),
                    SizedBox(width: 8),
                    Text(
                      "Bandar Lampung, Indonesia",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // ======================== TOMBOL LOGOUT ========================
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi kembali ke halaman login
                    // dan menghapus seluruh halaman sebelumnya agar tidak bisa kembali ke dashboard
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),

                  // 🔹 Desain tombol: warna coklat elegan dengan sudut melengkung
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6F4E37),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    shadowColor: Colors.brown.shade200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
