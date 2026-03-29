import 'package:flutter/material.dart';
import 'helpers/data.dart';
import 'models/SanPham.dart';
import 'widgets/SanPhamWidgets.dart';
import 'widgets/searching.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sản Phẩm',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static List<SanPham> gioHang = [];
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? "Danh sách Sản Phẩm" : "Giỏ hàng của tôi (${MyHomePage.gioHang.length})"),
        backgroundColor: const Color.fromARGB(255, 6, 151, 35),
        foregroundColor: Colors.white,
        centerTitle: true,
        ),
        body: _currentIndex == 0 ? trangSanPham() : trangGioHang(),
        bottomNavigationBar: MyBottomNav(
          onTabSelected: (index) {
            setState(() {
              _currentIndex = index;
            }
            );
          },
      ),
    );
  }

  Widget trangSanPham() {
    return Column(
      children: [
        SearchInput(),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: danhsachSanPham.length,
            itemBuilder: (context, index) {
              final itemMap = danhsachSanPham[index];
              final sanPhamObject = SanPham.fromMap(itemMap);
              return SanPhamWidgets(sanPham: sanPhamObject);
            },
          ),
        ),
      ],
    );
  }

  Widget trangGioHang() {
    if (MyHomePage.gioHang.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "Giỏ hàng trống",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: MyHomePage.gioHang.length,
      itemBuilder: (context, index) {
        final item = MyHomePage.gioHang[index];
        return ListTile(
          leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("${item.price} VND", style: const TextStyle(color: Colors.red)),

          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              setState(() {
                MyHomePage.gioHang.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}