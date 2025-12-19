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
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
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
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return buildeUniqlo(context, Listpic.sample[index]);
            },
            itemCount: Listpic.sample.length,
          ),
        ),
      ),
    );
  }

  Widget buildeUniqlo(BuildContext context, Listpic uni) {
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
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: const EdgeInsets.all(
              10), // เพิ่มระยะห่างระหว่างการ์ดให้นิดนึงจะสวยขึ้น
          child: Column(
            children: <Widget>[
              // เรียกใช้ Widget จากไฟล์ที่เราแยกไว้
              ProductImage(
                imagePath: uni.imageUrl,
                height: 250, // อยากปรับความสูงรูปแก้ตรงนี้ได้เลย
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  uni.imgLable,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
