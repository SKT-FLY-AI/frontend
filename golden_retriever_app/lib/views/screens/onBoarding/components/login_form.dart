// lib/views/screens/onboarding/components/login_form.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../services/auth_service/auth_service.dart';
import '../../../../services/auth_service/login_service.dart';
import '../../homeScreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() => _isLoading = true);

    // LoginService를 사용하여 로그인 시도
    final accessToken = await LoginService.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (accessToken != null) {
      // Access token으로부터 userId를 추출
      final userId = await AuthService.extractUserIdFromToken(accessToken);

      if (userId != null) {
        // userId를 사용하여 username을 가져옴
        final username = await AuthService.getUserName(userId);

        if (username != null) {
          _navigateToHomeScreen(username);
        } else {
          _showErrorDialog('Failed to retrieve user information.');
        }
      } else {
        _showErrorDialog('Failed to extract user ID from token.');
      }
    } else {
      _showErrorDialog('Login failed.');
    }

    setState(() => _isLoading = false);
  }

  void _navigateToHomeScreen(String username) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => HomeScreen(username: username),
      ),
    );
  }

  void _showErrorDialog(String error) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('로그인 실패'),
          content: Text(error),
          actions: [
            CupertinoDialogAction(
              child: const Text('확인'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
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
              children: [
                CupertinoTextField(
                  controller: _emailController,
                  prefix: Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.3),
                    child: Icon(CupertinoIcons.mail_solid),
                  ),
                  placeholder: "Email",
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
                  style: TextStyle(fontSize: contextHeight * 0.2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                SizedBox(height: contextHeight * 0.2),
                CupertinoTextField(
                  controller: _passwordController,
                  prefix: Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.3),
                    child: Icon(CupertinoIcons.padlock_solid),
                  ),
                  placeholder: "Password",
                  obscureText: true,
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
                  style: TextStyle(fontSize: contextHeight * 0.2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                SizedBox(height: contextHeight * 0.5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
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
                    onPressed: _login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
