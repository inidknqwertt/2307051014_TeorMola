import 'package:flutter/material.dart';
import 'package:myapp/widgets/coffee_card.dart';
import 'profile_page.dart';

/// Halaman utama (Dashboard) aplikasi CafféLux.
/// Menampilkan daftar menu kopi dan halaman profil pengguna.
/// Memiliki navigasi bawah (BottomNavigationBar) untuk berpindah antar tampilan.
class DashboardPage extends StatefulWidget {
  final String username; // Menyimpan nama pengguna dari halaman login

  const DashboardPage({super.key, required this.username});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // 🔹 Menyimpan index halaman aktif (0 = Coffee Menu, 1 = Profile)
  int _selectedIndex = 0;

  // 🔹 Data dummy untuk daftar menu kopi
  final List<Map<String, String>> coffeeList = [
    {
      "name": "Espresso",
      "price": "Rp 25.000",
      "image": "assets/images/espresso.png"
    },
    {
      "name": "Cappuccino",
      "price": "Rp 30.000",
      "image": "assets/images/cappuccino.png"
    },
    {
      "name": "Latte",
      "price": "Rp 28.000",
      "image": "assets/images/latte.png"
    },
    {
      "name": "Mocha",
      "price": "Rp 32.000",
      "image": "assets/images/mocha.png"
    },
  ];

  // 🔹 Judul yang ditampilkan di AppBar sesuai halaman aktif
  final List<String> _titles = ["Coffee Menu", "Profile"];

  @override
  Widget build(BuildContext context) {
    // 🔹 Daftar halaman yang ditampilkan sesuai index BottomNavigationBar
    final pages = [
      _buildCoffeeList(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE7), // Warna latar lembut (cream)

      // ====================== APP BAR ======================
      appBar: AppBar(
        backgroundColor: const Color(0xFF6F4E37), // Warna coklat kopi elegan
        foregroundColor: Colors.white, // Warna teks & ikon putih
        centerTitle: true,
        elevation: 3, // Bayangan lembut di bawah AppBar

        // 🔹 Judul menyesuaikan tab yang aktif
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),

      // ====================== BODY ======================
      // 🔹 Menampilkan halaman sesuai tab aktif (Menu / Profile)
      body: pages[_selectedIndex],

      // ====================== BOTTOM NAVIGATION ======================
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF6F4E37), // Warna aktif (espresso brown)
        unselectedItemColor: Colors.brown.shade300, // Warna item nonaktif
        currentIndex: _selectedIndex, // Index halaman aktif saat ini

        // 🔹 Saat item di-tap, ubah halaman aktif
        onTap: (index) => setState(() => _selectedIndex = index),

        // 🔹 Type fixed agar label selalu tampil
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  /// Widget untuk menampilkan daftar menu kopi dalam bentuk list.
  /// Menggunakan custom widget `CoffeeCard` dari folder widgets/.
  Widget _buildCoffeeList() {
    return ListView.builder(
      itemCount: coffeeList.length, // Jumlah item dalam list
      padding: const EdgeInsets.symmetric(vertical: 12),

      // 🔹 Builder untuk setiap item dalam daftar
      itemBuilder: (context, index) {
        final coffee = coffeeList[index];
        return CoffeeCard(
          name: coffee["name"]!, // Nama kopi
          price: coffee["price"]!, // Harga kopi
          imageUrl: coffee["image"]!, // Gambar kopi dari assets
        );
      },
    );
  }
}
