// ไฟล์: lib/Show-Pic/product_image.dart
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final BoxFit fit;

  const ProductImage({
    super.key,
    required this.imagePath,
    this.height = 300, // ค่าความสูงเริ่มต้น
    this.fit = BoxFit.contain, // ค่าการวางภาพเริ่มต้น
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[100], // ใส่สีพื้นหลังอ่อนๆ ให้ดูดีเวลาโหลด
      ),
      child: Image.asset(
        imagePath,
        fit: fit,
      ),
    );
  }
}
