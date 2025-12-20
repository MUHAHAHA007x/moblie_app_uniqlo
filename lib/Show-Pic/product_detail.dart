// ไฟล์: lib/Show-Pic/product_detail.dart
import 'package:flutter/material.dart';
import 'package:moblie_app_uniqlo/Show-Pic/List-Pic.dart';
import 'package:moblie_app_uniqlo/Show-Pic/product_image.dart';

// 1. เปลี่ยนจาก StatelessWidget เป็น StatefulWidget เพื่อให้หน้าจออัปเดตได้
class ProductDetail extends StatefulWidget {
  final Listpic product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // 2. ประกาศตัวแปรสำหรับเก็บจำนวน และราคาพื้นฐาน
  int _quantity = 1;
  int _basePrice = 0;

  @override
  void initState() {
    super.initState();
    // 3. แปลงราคาจาก String ('1,490 THB') ให้เป็นตัวเลข (1490) เพื่อใช้คำนวณ
    // ลบ ',' และ ' THB' ออกก่อนแปลง
    String cleanPrice =
        widget.product.price.replaceAll(',', '').replaceAll(' THB', '').trim();
    _basePrice = int.tryParse(cleanPrice) ?? 0;
  }

  // ฟังก์ชันเพิ่มจำนวน
  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  // ฟังก์ชันลดจำนวน (ไม่ให้ต่ำกว่า 1)
  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. คำนวณราคารวมทุกครั้งที่หน้าจอวาดใหม่
    int totalPrice = _basePrice * _quantity;
    // จัดรูปแบบราคาให้มีลูกน้ำคั่น (แบบง่ายๆ)
    String formattedPrice = totalPrice.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

    return Scaffold(
      appBar: AppBar(title: Text(widget.product.imgLable)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ส่วนรูปภาพ
            ProductImage(
              imagePath: widget.product.imageUrl,
              height: 300,
              fit: BoxFit.contain,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.imgLable,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // --- ส่วนแสดงราคาที่อัปเดตได้ ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$formattedPrice THB', // แสดงราคาที่คำนวณแล้ว
                        style: const TextStyle(
                            fontSize: 24, // เพิ่มขนาดให้เด่นขึ้น
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),

                      // --- ส่วนปุ่มเพิ่ม/ลดจำนวน ---
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: _decrementQuantity,
                              icon: const Icon(Icons.remove),
                              color: Colors.black,
                            ),
                            Text(
                              '$_quantity',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: _incrementQuantity,
                              icon: const Icon(Icons.add),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30), // ขีดคั่นแบ่งส่วน

                  const Text("รายละเอียดสินค้า:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 5),
                  Text(
                    widget.product.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
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
