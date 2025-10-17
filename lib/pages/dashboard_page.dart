import 'package:flutter/material.dart';
import 'package:myapp/widgets/coffee_card.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> coffeeList = [
    {"name": "Espresso", "price": "Rp 25.000", "image": "assets/images/espresso.png"},
    {"name": "Cappuccino", "price": "Rp 30.000", "image": "assets/images/cappuccino.png"},
    {"name": "Latte", "price": "Rp 28.000", "image": "assets/images/latte.png"},
    {"name": "Mocha", "price": "Rp 32.000", "image": "assets/images/mocha.png"},
  ];

  final List<String> _titles = ["Coffee Menu", "Profile"];

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildCoffeeList(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6F4E37),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF6F4E37),
        unselectedItemColor: Colors.brown.shade300,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCoffeeList() {
    return ListView.builder(
      itemCount: coffeeList.length,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        final coffee = coffeeList[index];
        return CoffeeCard(
          name: coffee["name"]!,
          price: coffee["price"]!,
          imageUrl: coffee["image"]!,
        );
      },
    );
  }
}
