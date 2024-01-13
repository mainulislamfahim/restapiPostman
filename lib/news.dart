import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/api_request.dart';

class News extends StatefulWidget {
  const News({required this.index, super.key});
  final String index;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  // Map<String, dynamic> news = {};

  void initState() {
    super.initState();
    // fetchData();
  }

  Future<void> fetchData() async {
    try {
      await fetchNews((responseData) {
        setState(() {
          //news = List<Map<String, dynamic>>.from(responseData);
        });
      });
    } catch (e) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsPaper"),
      ),
      body: Column(
        children: [
          Text(widget.index.toString()),
        ],
      ),
    );
  }
}
