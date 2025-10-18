import 'package:flutter/material.dart';

/// Widget `CoffeeCard` digunakan untuk menampilkan informasi satu jenis kopi.
/// Berisi gambar, nama, harga, dan tombol tambah ke keranjang.
/// Desain dibuat elegan dengan warna coklat lembut sesuai tema aplikasi CafféLux.
class CoffeeCard extends StatelessWidget {
  // 🔹 Properti untuk menyimpan data tiap produk kopi
  final String name;     // Nama kopi (contoh: Espresso)
  final String price;    // Harga kopi (contoh: Rp 25.000)
  final String imageUrl; // Path gambar kopi di folder assets

  const CoffeeCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 🔹 Margin luar untuk memberi jarak antar card
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      // 🔹 Dekorasi card: warna putih, sudut melengkung, dan bayangan lembut
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      // ======================= ISI CARD (ListTile) =======================
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        // ======================= GAMBAR KOPI =======================
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imageUrl, // Mengambil gambar dari folder assets
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),

        // ======================= NAMA KOPI =======================
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.brown,
          ),
        ),

        // ======================= HARGA KOPI =======================
        subtitle: Text(
          price,
          style: TextStyle(
            fontSize: 15,
            color: Colors.brown.shade400,
          ),
        ),

        // ======================= TOMBOL TAMBAH KE KERANJANG =======================
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.brown.shade100,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.brown),

            // 🔹 Saat tombol ditekan, tampilkan SnackBar sebagai notifikasi
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$name ditambahkan ke keranjang!"),
                  backgroundColor: Colors.brown,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
