// lib/screens/signup_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://10.0.2.2:3001/users/signup'); // Replace with your backend URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      _showSuccessDialog();
    } else {
      _showErrorDialog(response.reasonPhrase ?? 'Unknown error');
    }
  }

  void _showSuccessDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return const CupertinoAlertDialog(
          title: Text('Success'),
          content: Text('Membership registration completed!'),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the success dialog
      Navigator.pop(context); // Go back to the login screen
    });
  }

  void _showErrorDialog(String error) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text('Failed to register: $error'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sign Up'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CupertinoTextField(
                  controller: _usernameController,
                  placeholder: 'Username',
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Icon(CupertinoIcons.person),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CupertinoTextField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  obscureText: true,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Icon(CupertinoIcons.padlock),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const CupertinoActivityIndicator()
                  : CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: const Text('Sign Up'),
                onPressed: _register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
