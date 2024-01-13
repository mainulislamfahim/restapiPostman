import 'dart:convert';
import 'package:http/http.dart' as http;

typedef NewsCallback = void Function(List<dynamic> responseData);

Future<void> fetchNews(NewsCallback callback) async {
  try {
    final response = await http.get(
      Uri.parse("http://universities.hipolabs.com/search?name=middle"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      callback(responseData); // Call the callback with the response data
    } else {
      print("HTTP Error: ${response.statusCode}");
      throw Exception("HTTP Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    throw e; // Re-throw the exception to propagate it up the call stack
  }
}
