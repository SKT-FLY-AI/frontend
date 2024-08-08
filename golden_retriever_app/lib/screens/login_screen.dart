// lib.screens/login_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'app_tab_controller.dart'; // AppTabController로 변경

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse('http://10.0.2.2:3001/users/login'); // Mock 서버 URL 사용
    // final url = Uri.parse('http://10.0.2.2:8000/users/login'); // FastAPI 서버 URL 사용
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const AppTabController()), // AppTabController로 변경
      );
    } else {
      print('Login failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Join-Login'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: _usernameController,
                placeholder: 'Username',
                prefix: const Icon(CupertinoIcons.person),
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                prefix: const Icon(CupertinoIcons.padlock),
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: const Text('LOGIN'),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}