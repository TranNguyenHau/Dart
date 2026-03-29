import 'package:flutter/material.dart';
import '../models/SanPham.dart';
import 'Xacnhanwidgets.dart'; 
import '../main.dart';

class SanPhamWidgets extends StatelessWidget {
  final SanPham sanPham;

  const SanPhamWidgets({super.key, required this.sanPham});

  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: () async {
        bool? confirm = await showDialog<bool>(
          context: context,
          builder: (context) => Xacnhanwidgets(sanPham: sanPham),
        );

        if (confirm == true) {
          MyHomePage.gioHang.add(sanPham);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Đã thêm ${sanPham.name} vào giỏ hàng!"),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  sanPham.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sanPham.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text("${sanPham.rate}", 
              style: TextStyle(fontSize: 13, color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
          const SizedBox(width: 4),
        ],
      ),

      const SizedBox(height: 4),
                  Text(
                    "${sanPham.price} VND",
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}