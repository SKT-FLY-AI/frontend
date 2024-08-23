// lib/views/screens/onboarding/components/login_form.dart

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../controllers/auth_service/auth_service.dart';
import '../../../../controllers/auth_service/dog_service.dart'; // DogService 추가
import '../../../../controllers/auth_service/login_service.dart';
import '../../homeScreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage _storage = const FlutterSecureStorage(); // Secure Storage 추가
  bool _isLoading = false;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final loginResponse = await LoginService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (loginResponse != null && loginResponse.statusCode == 200) {
        final accessToken = json.decode(loginResponse.body)['access_token'];

        // 모든 강아지 정보 가져오기 및 저장
        final dogs = await DogService.fetchAllDogs();
        if (dogs != null && dogs.isNotEmpty) {
          for (var dog in dogs) {
            await _storage.write(key: 'dog_name', value: dog['dog_name']);
            // 필요한 경우 다른 강아지 정보도 저장
          }
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        _showDialog('Failed to login: ${loginResponse?.reasonPhrase ?? 'Unknown error'}');
      }
    } catch (e) {
      _showDialog('Error during login: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmailField(contextWidth, contextHeight),
                SizedBox(height: contextHeight * 0.2),
                _buildPasswordField(contextWidth, contextHeight),
                SizedBox(height: contextHeight * 0.5),
                _buildLoginButton(contextHeight),
                if (_isLoading) const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField(double contextWidth, double contextHeight) {
    return CupertinoTextField(
      controller: _emailController,
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.3),
        child: const Icon(CupertinoIcons.mail_solid),
      ),
      placeholder: "Email",
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2),
      style: TextStyle(fontSize: contextHeight * 0.2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildPasswordField(double contextWidth, double contextHeight) {
    return CupertinoTextField(
      controller: _passwordController,
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.3),
        child: const Icon(CupertinoIcons.padlock_solid),
      ),
      placeholder: "Password",
      obscureText: true,
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2),
      style: TextStyle(fontSize: contextHeight * 0.2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildLoginButton(double contextHeight) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: contextHeight * 0.15),
        child: const Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: _isLoading ? null : _login,
      ),
    );
  }
}
