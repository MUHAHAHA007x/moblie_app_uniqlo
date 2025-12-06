import 'package:flutter/material.dart';
import 'package:moblie_app_uniqlo/Show-Pic/List-Pic.dart';

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
              return buildeUniqlo(Listpic.sample[index]);
            },
            itemCount: Listpic.sample.length,
          ),
        ),
      ),
    );
  }

  Widget buildeUniqlo(Listpic uni) {
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(uni.imageUrl)),
          Text(uni.imgLable),
        ],
      ),
    );
  }
}
