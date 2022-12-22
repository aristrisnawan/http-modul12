import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Center(
          child: Text("Sorry untuk halaman ini ilmunya belum ketenu :D"),
        ),
      ),
    );
  }
}
