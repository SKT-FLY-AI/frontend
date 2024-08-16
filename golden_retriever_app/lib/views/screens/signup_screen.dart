// lib/screens/signup_screen.dart

import 'package:flutter/cupertino.dart';
import '../../services/auth_service/register_service.dart';
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
  int _selectedGender = -1; // 초기값은 -1로 설정 (선택되지 않음)
  bool _isLoading = false;

  Future<void> _register() async {
    if (_selectedGender == -1) {
      _showDialog('성별을 선택해주세요');
      return;
    }

    _setLoading(true);

    final response = await RegisterService.register(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      usersex: _selectedGender,
    );

    _setLoading(false);

    if (response != null && response.statusCode == 200) {
      _showDialog('회원가입 완료!', isSuccess: true);
    } else {
      _showDialog('Failed to register: ${response?.reasonPhrase ?? 'Unknown error'}');
    }
  }

  void _showDialog(String message, {bool isSuccess = false}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(isSuccess ? 'Success' : 'Error'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                if (isSuccess) {
                  Navigator.pop(context); // 회원가입 성공시 로그인 화면으로 돌아가기
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('회원가입'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _usernameController,
                placeholder: '닉네임',
                prefixIcon: CupertinoIcons.person,
              ),
              const SizedBox(height: 32),
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
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '성별:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  const SizedBox(width: 35),
                  _buildGenderButton('남성', 0),
                  const SizedBox(width: 15),
                  _buildGenderButton('여성', 1),
                ],
              ),
              const SizedBox(height: 72),
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

  void _selectGender(int gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  Widget _buildGenderButton(String gender, int value) {
    return CupertinoButton(
      onPressed: () => _selectGender(value),
      color: _selectedGender == value
          ? CupertinoColors.activeOrange
          : CupertinoColors.inactiveGray,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Text(
        gender,
        style: const TextStyle(color: CupertinoColors.white),
      ),
    );
  }
}
