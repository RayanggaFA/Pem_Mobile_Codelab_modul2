// File ini berisi UI untuk menampilkan data dalam bentuk list, mengambil data dari API dan menampilkannya dalam bentuk ListTile.
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/post_model.dart';
import 'webview_page.dart';

class PostListPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
        actions: [
          IconButton(
            icon: Icon(Icons.web),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebViewPage(url: 'https://lms.umm.ac.id/')),//Link web yang digunakan untuk WebView Page
              );
            },
          ),
        ],
      ),


        // Mengambil data API dan Penambahan UI
        body:

    FutureBuilder(
    future: apiService.fetchData(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else {
    if (snapshot.data != null) {
    final Welcome? welcome = Welcome.fromJson(snapshot.data!);
    if (welcome != null) {
    return ListView.builder(
    itemCount: welcome.articles.length,
    itemBuilder: (context, index) {
    final article = welcome.articles[index];
    return Card(
    child: ListTile(
    title: Text(
    article.title,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
    article.description,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),
    ),
    );
    },
    );
    } else {
    return Center(child: Text('No posts found'));
    }
    } else {
    return Center(child: Text('No data found'));
              }
            }
          },
        )
      )
    ;}
}