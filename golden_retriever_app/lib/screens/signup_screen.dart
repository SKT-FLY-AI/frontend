// lib/screens/signup_screen.dart

import 'package:flutter/cupertino.dart';
import '../services/auth_service/auth_service.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final response = await AuthService.register(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (response != null && response.statusCode == 200) {
      _showSuccessDialog();
    } else {
      _showErrorDialog(response?.reasonPhrase ?? 'Unknown error');
    }
  }

  void _showSuccessDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return const CupertinoAlertDialog(
          title: Text('Success'),
          content: Text('Registration completed!'),
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
              CustomTextField(
                controller: _usernameController,
                placeholder: 'Username',
                prefixIcon: CupertinoIcons.person,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                placeholder: 'Email',
                prefixIcon: CupertinoIcons.mail,
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
