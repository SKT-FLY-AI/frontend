// lib/screens/login_screen.dart

import 'package:flutter/cupertino.dart';
import '../services/auth_service.dart';
import 'app_tab_controller.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await AuthService.login(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (response != null && response.statusCode == 200) {
      _navigateToHomeScreen();
    } else {
      _showErrorDialog(response?.statusCode ?? 'Unknown error');
    }
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const AppTabController()),
    );
  }

  void _showErrorDialog(dynamic error) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Login Failed'),
          content: Text('Error: $error'),
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
        middle: Text('Join-Login'),
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
                child: const Text('LOGIN'),
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
                  'Sign Up',
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