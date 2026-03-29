class SanPham {
  final String name;
  final num price; 
  final num rate;  
  final String imageUrl;

  SanPham({
    required this.name,
    required this.price,
    required this.rate,
    required this.imageUrl,
  });

  factory SanPham.fromMap(Map<String, dynamic> map) {
    return SanPham(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      rate: map['rate'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}