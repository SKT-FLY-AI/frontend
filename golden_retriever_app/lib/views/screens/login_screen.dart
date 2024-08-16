// lib/screens/login_screen.dart

import 'package:flutter/cupertino.dart';
import '../../services/auth_service/login_service.dart';
import '../widgets/custom_text_field.dart';
import 'app_tab_controller.dart';
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
    setState(() {
      _isLoading = true;
    });

    print('로그인 시작');  // 로그인 시작 지점 로그

    try {
      final response = await LoginService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      print('로그인 응답 수신: $response');  // 로그인 응답 수신 후 로그

      setState(() {
        _isLoading = false;
      });

      if (response != null) {
        print('로그인 응답 처리 중...');  // 응답이 있을 때 처리 시작 로그

        if (response.containsKey('access_token')) {
          print('액세스 토큰 확인 완료, 홈 화면으로 이동');  // 액세스 토큰 확인 로그
          _navigateToHomeScreen();
        } else {
          print('응답에 액세스 토큰이 없음, 에러 메시지 표시');  // 토큰이 없을 때 로그
          _showErrorDialog(response['message'] ?? 'An unexpected error occurred.');
        }
      } else {
        print('응답이 없습니다. 서버로부터의 응답이 없습니다.');  // 응답이 null일 때 로그
        _showErrorDialog('No response from server.');
      }
    } catch (e) {
      print('로그인 도중 에러 발생: $e');  // 예외 발생 로그
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog('An error occurred: $e');
    }

    print('로그인 프로세스 종료');  // 로그인 프로세스 종료 시점 로그
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
          content: Text(error),
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
