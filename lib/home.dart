import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/api_request.dart';
import 'package:rest_api/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> news = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      await fetchNews((responseData) {
        setState(() {
          news = List<Map<String, dynamic>>.from(responseData);
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
        title: const Text('Rest API fetch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final newsID = news[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  News(index: newsID['web_pages'])));
                    },
                    child: Card(
                      elevation: 10,
                      // Customize the content inside the Card
                      child: ListTile(
                        title: Text(newsID['name'].toString()),
                        subtitle: Text(newsID['country'].toString()),
                        leading: Icon(Icons.read_more),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
