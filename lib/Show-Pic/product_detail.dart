import 'package:flutter/material.dart';
import 'package:moblie_app_uniqlo/Show-Pic/List-Pic.dart';
import 'package:moblie_app_uniqlo/Show-Pic/product_image.dart'; // import เพื่อใช้ ProductImage

class ProductDetail extends StatelessWidget {
  final Listpic product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.imgLable)),
      // เพิ่ม SingleChildScrollView เพื่อให้เลื่อนหน้าจอได้ถ้ารายละเอียดเยอะ
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความชิดซ้าย
          children: [
            // ใช้ ProductImage แทน Image.asset เพื่อความสวยงามและคุม size
            ProductImage(
              imagePath: product.imageUrl,
              height: 300, // ปรับความสูงรูปในหน้ารายละเอียดให้ใหญ่ขึ้นหน่อย
              fit: BoxFit.contain, // หรือใช้ cover ถ้าอยากให้เต็มพื้นที่
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.imgLable,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.price,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text("รายละเอียดสินค้า:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    product.description,
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.5), // height ช่วยให้อ่านง่ายขึ้น
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
