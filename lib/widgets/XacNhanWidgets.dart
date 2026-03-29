import 'package:flutter/material.dart';
import '../models/SanPham.dart';

class Xacnhanwidgets extends StatelessWidget {
  final SanPham sanPham;
  const Xacnhanwidgets({super.key, required this.sanPham});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Xác nhận thêm sản phẩm"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(sanPham.imageUrl, height: 100),
          SizedBox(height: 10),
          Text(sanPham.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("${sanPham.price} VND", style: TextStyle(color: Colors.green)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text("Hủy"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text("Xác nhận"),
        ),
      ],
    );
  }
}