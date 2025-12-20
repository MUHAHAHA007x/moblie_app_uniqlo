import 'package:flutter/material.dart';
import 'package:moblie_app_uniqlo/Show-Pic/List-Pic.dart';
import 'package:moblie_app_uniqlo/Show-Pic/product_detail.dart';
import 'package:moblie_app_uniqlo/Show-Pic/product_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ปิดป้าย Debug มุมขวาบน
      title: 'UNIQLO Shop',
      theme: ThemeData(
        primarySwatch: Colors.red, // สีแดงแบบ Uniqlo
        scaffoldBackgroundColor:
            Colors.grey[50], // พื้นหลังสีเทาอ่อนๆ ให้สินค้าเด่น
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black, // ตัวหนังสือสีดำ
          elevation: 0,
        ),
      ),
      home: const MyHomePage(title: 'UNIQLO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: Listpic.sample.length,
          // กำหนดโครงสร้างตาราง (Grid)
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 รูปต่อแถว
            childAspectRatio:
                0.7, // สัดส่วน กว้าง:สูง (ปรับเลขนี้ถ้ารูปดูอ้วน/ผอมไป)
            crossAxisSpacing: 10, // ระยะห่างแนวนอน
            mainAxisSpacing: 10, // ระยะห่างแนวตั้ง
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildUniqloItem(context, Listpic.sample[index]);
          },
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างการ์ดสินค้า (ปรับปรุงจากเดิม)
  Widget buildUniqloItem(BuildContext context, Listpic uni) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetail(product: uni);
            },
          ),
        );
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ส่วนรูปภาพ
            Expanded(
              child: ClipRRect(
                // ตัดมุมรูปด้านบนให้มนตามการ์ด
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: ProductImage(
                  imagePath: uni.imageUrl,
                  height: double.infinity, // ให้รูปยืดเต็มพื้นที่ที่เหลือ
                  fit: BoxFit.cover, // ให้รูปเต็มกรอบสวยงาม
                ),
              ),
            ),

            // ส่วนข้อความ
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    uni.imgLable,
                    maxLines: 1, // โชว์แค่บรรทัดเดียว
                    overflow: TextOverflow.ellipsis, // ยาวเกินให้ขึ้น ...
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    uni.price,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
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
