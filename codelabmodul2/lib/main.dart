import 'package:flutter/material.dart';
import 'pages/post_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codelab Modul 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home : PostListPage(),
    );
  }
}
