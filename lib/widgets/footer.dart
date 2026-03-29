import 'package:flutter/material.dart';

class MyBottomNav extends StatefulWidget {
  final Function(int) onTabSelected;
  const MyBottomNav({super.key, required this.onTabSelected});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  Widget footerMenu({required String text, required IconData icon, required int index}) {
    bool isSelected = _selectedIndex == index;
    return TextButton(
      onPressed: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.green : Colors.grey),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          footerMenu(text: 'Danhsách', icon: Icons.list, index: 0),
          footerMenu(text: 'Giỏhàng', icon: Icons.shopping_cart, index: 1),
        ],
      ),
    );
  }
}