import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http.get(
      Uri.parse("http://universities.hipolabs.com/search?name=middle"),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);

      // final List<dynamic> newsData = responseData[''];
      setState(() {
        news = List<Map<String, dynamic>>.from(responseData);
      });
    } else {
      print("HTTP Error: ${response.statusCode}");
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
                    onTap: () {},
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
