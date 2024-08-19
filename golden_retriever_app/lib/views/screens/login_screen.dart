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

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('로그인'),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(contextWidth * 0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _emailController,
                placeholder: 'Email',
                prefixIcon: CupertinoIcons.mail,
              ),
              CustomTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                prefixIcon: CupertinoIcons.padlock,
              ),
              SizedBox(height: contextHeight * 0.4),
              _isLoading
                  ? const CupertinoActivityIndicator()
                  : Container(
                margin: EdgeInsets.symmetric(horizontal: contextWidth * 0.6),
                padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
                child: CupertinoButton(
                  color: CupertinoColors.activeOrange,
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.15, horizontal: contextWidth * 0.05),
                  onPressed: _login,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                    children: [Text('로그인'),],
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.1),
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

