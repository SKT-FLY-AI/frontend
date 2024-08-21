// // lib/screens/signup_screen.dart
//
// import 'package:flutter/cupertino.dart';
// import '../../services/auth_service/register_service.dart';
// import '../widgets/custom_text_field.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   int _selectedGender = -1; // 초기값은 -1로 설정 (선택되지 않음)
//   bool _isLoading = false;
//
//   Future<void> _register() async {
//     if (_selectedGender == -1) {
//       _showDialog('성별을 선택해주세요');
//       return;
//     }
//
//     _setLoading(true);
//
//     final response = await RegisterService.register(
//       username: _usernameController.text,
//       email: _emailController.text,
//       password: _passwordController.text,
//       usersex: _selectedGender,
//     );
//
//     _setLoading(false);
//
//     if (response != null && response.statusCode == 200) {
//       _showDialog('회원가입 완료!', isSuccess: true);
//     } else {
//       _showDialog('Failed to register: ${response?.reasonPhrase ?? 'Unknown error'}');
//     }
//   }
//
//   void _showDialog(String message, {bool isSuccess = false}) {
//     showCupertinoDialog(
//       context: context,
//       builder: (context) {
//         return CupertinoAlertDialog(
//           title: Text(isSuccess ? 'Success' : 'Error'),
//           content: Text(message),
//           actions: [
//             CupertinoDialogAction(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.pop(context);
//                 if (isSuccess) {
//                   Navigator.pop(context); // 회원가입 성공시 로그인 화면으로 돌아가기
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _setLoading(bool value) {
//     setState(() {
//       _isLoading = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double contextHeight = MediaQuery.of(context).size.height * 0.1;
//     final double contextWidth = MediaQuery.of(context).size.width * 0.1;
//
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('회원가입'),
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomTextField(
//                 controller: _usernameController,
//                 placeholder: '닉네임',
//                 prefixIcon: CupertinoIcons.person,
//               ),
//               SizedBox(height: contextHeight * 0.3),
//               CustomTextField(
//                 controller: _emailController,
//                 placeholder: 'Email',
//                 prefixIcon: CupertinoIcons.mail,
//               ),
//               CustomTextField(
//                 controller: _passwordController,
//                 placeholder: 'Password',
//                 obscureText: true,
//                 prefixIcon: CupertinoIcons.padlock,
//               ),
//               SizedBox(height: contextHeight * 0.3),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     '성별:',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: CupertinoColors.systemGrey,
//                     ),
//                   ),
//                   SizedBox(width: contextWidth * 0.8),
//                   _buildGenderButton('남성', 0),
//                   SizedBox(width: contextWidth * 0.4),
//                   _buildGenderButton('여성', 1),
//                 ],
//               ),
//               SizedBox(height: contextHeight * 0.6),
//               _isLoading
//                   ? const CupertinoActivityIndicator()
//                   : CupertinoButton(
//                 color: CupertinoColors.activeOrange,
//                 child: const Text('회원 가입'),
//                 onPressed: _register,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _selectGender(int gender) {
//     setState(() {
//       _selectedGender = gender;
//     });
//   }
//
//   Widget _buildGenderButton(String gender, int value) {
//     return CupertinoButton(
//       onPressed: () => _selectGender(value),
//       color: _selectedGender == value
//           ? CupertinoColors.activeOrange
//           : CupertinoColors.inactiveGray,
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       child: Text(
//         gender,
//         style: const TextStyle(color: CupertinoColors.white),
//       ),
//     );
//   }
// }



import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service/register_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/rive_background.dart';

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
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          const RiveBackground(), // 애니메이션 배경 추가
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
                                offset: Offset(2.0, 2.0), // 그림자의 위치
                                blurRadius: 10.0, // 그림자의 블러 정도
                                color: Colors.black.withOpacity(0.2), // 그림자 색상 및 투명도
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: contextHeight * 0.3),
                        CustomTextField(
                          controller: _usernameController,
                          placeholder: '닉네임',
                          prefixIcon: CupertinoIcons.person,
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
                        SizedBox(height: contextHeight * 0.3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '성별:',
                              style: TextStyle(
                                fontSize: contextHeight * 0.2,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.white,
                              ),
                            ),
                            SizedBox(width: contextWidth * 0.8),
                            _buildGenderButton('남성', 0),
                            SizedBox(width: contextWidth * 0.4),
                            _buildGenderButton('여성', 1),
                          ],
                        ),
                        SizedBox(height: contextHeight * 0.6),
                        _isLoading
                            ? const CupertinoActivityIndicator()
                            : CupertinoButton(
                              color: CupertinoColors.activeOrange,
                              child: Text('SIGN UP'),
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

  void _selectGender(int gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  Widget _buildGenderButton(String gender, int value) {
    return CupertinoButton(
      onPressed: () => _selectGender(value),
      color: _selectedGender == value
          ? Colors.orange.withOpacity(0.9)
          : Colors.grey.withOpacity(0.9),
      padding: EdgeInsets.symmetric(
        horizontal: 24.0, vertical: 12.0
      ),
      child: Text(
        gender,
        style: TextStyle(
            color: CupertinoColors.white,
        ),
      ),
    );
  }
}
