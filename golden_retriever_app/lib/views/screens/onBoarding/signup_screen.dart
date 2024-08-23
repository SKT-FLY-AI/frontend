import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controllers/auth_service/register_service.dart';
import '../../../controllers/auth_service/login_service.dart';  // 로그인 서비스 임포트
import '../../../controllers/auth_service/auth_service.dart';  // AuthService 임포트
import '../../custom_text_field.dart';
import '../../rive_background.dart';
import '../onBoarding/dog_info_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    _setLoading(true);

    // 회원가입 요청
    final response = await RegisterService.register(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (response != null && response.statusCode == 200) {
      // 회원가입 성공 후 자동 로그인
      final loginResponse = await LoginService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (loginResponse != null && loginResponse.statusCode == 200) {
        // 로그인 성공 후 토큰에서 userID 추출
        final accessToken = json.decode(loginResponse.body)['access_token'];
        final userId = await AuthService.extractUserIdFromToken(accessToken);

        // 강아지 등록 화면으로 이동할 때 userID를 함께 전달
        _navigateToDogInfoScreen(userId!);
      } else {
        _showDialog('Failed to login: ${loginResponse?.reasonPhrase ?? 'Unknown error'}');
      }
    } else {
      _showDialog('Failed to register: ${response?.reasonPhrase ?? 'Unknown error'}');
    }

    _setLoading(false);
  }

  void _navigateToDogInfoScreen(int userId) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => DogInfoScreen(userId: userId), // userId 전달
      ),
    );
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
                  _navigateToDogInfoScreen(0); // 필요 시 적절한 ID 전달
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
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null,
        backgroundColor: CupertinoColors.transparent,
      ),
      child: Stack(
        children: [
          const RiveBackground(),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.55),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: contextHeight * 0.1,),
                        Text(
                          "✦ 회원가입 ✦",
                          style: TextStyle(
                            fontSize: contextHeight * 0.3,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: contextHeight * 0.3),
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
                        SizedBox(height: contextHeight * 0.6),
                        _isLoading
                            ? const CupertinoActivityIndicator()
                            : CupertinoButton(
                          color: CupertinoColors.activeOrange,
                          child: const Text('SIGN UP'),
                          onPressed: _register,
                        ),
                        SizedBox(height: contextHeight * 0.3,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
