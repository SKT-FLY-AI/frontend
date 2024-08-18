// lib/screens/login_screen.dart

import 'package:flutter/cupertino.dart';
import '../../services/auth_service/login_service.dart';
import '../../services/auth_service/auth_service.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

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
          title: const Text('Login Failed'),
          content: Text(error),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.4;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _emailController,
                placeholder: 'Email',
                prefixIcon: CupertinoIcons.mail,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                prefixIcon: CupertinoIcons.padlock,
              ),
              const SizedBox(height: 64),
              _isLoading
                  ? const CupertinoActivityIndicator()
                  : CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: const Text('로그인'),
                onPressed: _login,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: CupertinoColors.activeOrange,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
