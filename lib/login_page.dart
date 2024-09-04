import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonDecode
import 'package:task/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    final response = await http.get(Uri.parse('http://13.127.246.196:8000/api/registers'));

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);

      String enteredEmail = _emailController.text;
      String enteredPassword = _passwordController.text;

      // Iterate through all users to check credentials
      bool loginSuccessful = false;
      for (var user in users) {
        if (user['email'] == enteredEmail && user['phone_number'] == enteredPassword) {
          loginSuccessful = true;
          break;
        }
      }

      if (loginSuccessful) {
        // Navigate to MyHomePage on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      } else {
        // Show error message if login fails
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Login Failed'),
            content: Text('Incorrect email or password.'),
          ),
        );
      }
    } else {
      // Handle error if the API call fails
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch users from API.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
