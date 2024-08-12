// lib/screens/login_screen.dart

import 'package:flutter/cupertino.dart';
import '../services/auth_service/auth_service.dart';
import '../widgets/custom_text_field.dart';
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

    // if (response != null && response.containsKey('access_token')) {
    if (response != null) {
      // Store the access token if needed
      _navigateToHomeScreen();
    } else {
      _showErrorDialog(response?['message'] ?? 'Unknown error');
    }
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const AppTabController()),
    );
  }

  void _showErrorDialog(String error) {
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
              CustomTextField(
                controller: _usernameController,
                placeholder: 'Username',
                prefixIcon: CupertinoIcons.person,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                prefixIcon: CupertinoIcons.padlock,
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
