import 'dart:convert';
import 'package:http/http.dart' as http;

// Define the login function
Future<void> loginUser(String username, String password) async {
  final url = Uri.parse('http://13.127.246.196:8000/api/registers');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully logged in
      final responseData = jsonDecode(response.body);
      print('Login successful: $responseData');
      // Handle successful login (e.g., navigate to home screen, store token)
    } else {
      // Handle login failure
      print('Login failed: ${response.statusCode}');
      // Show error message to user
    }
  } catch (e) {
    // Handle other errors (e.g., network issues)
    print('Error: $e');
  }
}
