// lib/screens/login_screen.dart

import 'package:flutter/cupertino.dart';
import '../services/auth_service.dart';
import 'app_tab_controller.dart';

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
      _navigateToHome();
    } else {
      _showLoginError(response?.body);
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const AppTabController()),
    );
  }

  void _showLoginError(String? errorMessage) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Login Failed'),
          content: Text(errorMessage ?? 'An unknown error occurred.'),
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
          child: _isLoading ? const CupertinoActivityIndicator() : _buildLoginForm(),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
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
    );
  }
}
