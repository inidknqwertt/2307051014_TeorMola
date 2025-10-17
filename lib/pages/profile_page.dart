import 'package:flutter/material.dart';
import 'login_page.dart'; // Tambahkan import ke halaman login

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8EDE3), Color(0xFFD7B19D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          color: Colors.white.withOpacity(0.95),
          shadowColor: Colors.brown.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(height: 20),

                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F4E37),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Luxury Coffee Enthusiast ☕",
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                ),
                const SizedBox(height: 24),
                
//email dan lokasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.email_outlined, color: Colors.brown),
                    SizedBox(width: 8),
                    Text("nldksa615@gmail.com",
                        style: TextStyle(color: Colors.brown)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on_outlined, color: Colors.brown),
                    SizedBox(width: 8),
                    Text("Bandar Lampung, Indonesia",
                        style: TextStyle(color: Colors.brown)),
                  ],
                ),
                const SizedBox(height: 30),

                // 🟤 Tombol Logout diperbarui
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi balik ke login, hapus semua halaman sebelumnya
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6F4E37),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
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
