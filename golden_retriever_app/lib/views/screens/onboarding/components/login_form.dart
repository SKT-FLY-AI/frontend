// // lib/views/screens/onboarding/components/login_form.dart
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import '../../entryPoint/entry_point.dart';
//
// class SignInForm extends StatefulWidget {
//   const SignInForm({super.key});
//
//   @override
//   State<SignInForm> createState() => _SignInFormState();
// }
//
// class _SignInFormState extends State<SignInForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool isShowLoading = false;
//   bool isShowConfetti = false;
//
//   late SMITrigger error;
//   late SMITrigger success;
//   late SMITrigger reset;
//   late SMITrigger confetti;
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void _onCheckRiveInit(Artboard artboard) {
//     StateMachineController? controller =
//     StateMachineController.fromArtboard(artboard, 'State Machine 1');
//
//     if (controller == null) return; // controller == null일 경우 오류 방지.....ㅜ.ㅜ
//     artboard.addController(controller!);
//
//     error = controller.findInput<bool>('Error') as SMITrigger;
//     success = controller.findInput<bool>('Check') as SMITrigger;
//     reset = controller.findInput<bool>('Reset') as SMITrigger;
//   }
//
//   void _onConfettiRiveInit(Artboard artboard) {
//     StateMachineController? controller =
//     StateMachineController.fromArtboard(artboard, "State Machine 1");
//     artboard.addController(controller!);
//     confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
//   }
//
//   void signIn(BuildContext context) {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       // 이메일이나 비번이 비어있으면 오류 애니메이션 실행
//       error.fire();
//       Future.delayed(
//         const Duration(seconds: 2),
//             () {
//           setState(() {
//             isShowLoading = false;
//           });
//           reset.fire();
//         },
//       );
//     } else {
//       // 입력이 모두 유효한 경우
//       setState(() {
//         isShowConfetti = true;
//         isShowLoading = true;
//       });
//       Future.delayed(
//         const Duration(seconds: 1),
//             () {
//           success.fire();
//           Future.delayed(
//             const Duration(seconds: 2),
//                 () {
//               setState(() {
//                 isShowLoading = false;
//               });
//               confetti.fire();
//               Future.delayed(const Duration(seconds: 1), () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const EntryPoint(),
//                   ),
//                 );
//               });
//             },
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double contextHeight = MediaQuery.of(context).size.height * 0.1;
//     final double contextWidth = MediaQuery.of(context).size.height * 0.1;
//
//     return Stack(
//       children: [
//         Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.4),
//             child: Column(
//             children: [
//               /// 이메일 입력창
//               CupertinoTextField(
//                 controller: emailController,
//                 prefix: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
//                   child: Icon(CupertinoIcons.mail),
//                 ),
//                 placeholder: "Email",
//                 padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
//                 style: TextStyle(fontSize: contextHeight * 0.2),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.orangeAccent),
//                 ),
//               ),
//
//               SizedBox(height: contextHeight * 0.2),
//
//               /// 패스워드 입력창
//               CupertinoTextField(
//                 controller: passwordController,
//                 prefix: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
//                   child: Icon(CupertinoIcons.padlock),
//                 ),
//                 placeholder: "Password",
//                 obscureText: true,
//                 padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
//                 style: TextStyle(fontSize: contextHeight * 0.2),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.orangeAccent),
//                 ),
//               ),
//
//               SizedBox(height: contextHeight * 0.5),
//
//               /// 로그인 버튼
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.orange.withOpacity(0.6),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: const Offset(0, 0),
//                     ),
//                   ],
//                 ),
//                 child: CupertinoButton(
//                   padding: EdgeInsets.symmetric(vertical: contextHeight * 0.15),
//                   child: const Text(
//                     "LOGIN",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   onPressed: () {
//                     signIn(context);
//                   },
//                 ),
//               ),
//             ],
//           ),)
//         ),
//       if (isShowLoading)
//         const Center(
//           child: CircularProgressIndicator(),
//         ),
//       if (isShowConfetti)
//         Positioned.fill(
//           child: RiveAnimation.asset(
//             "assets/RiveAssets/confetti.riv",
//             onInit: _onConfettiRiveInit,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }



// lib/views/screens/onboarding/components/login_form.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../services/auth_service/auth_service.dart';
import '../../../../services/auth_service/login_service.dart';
import '../../home_screen.dart';

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

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.4),
            child: Column(
              children: [
                CupertinoTextField(
                  controller: _emailController,
                  prefix: Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                    child: Icon(CupertinoIcons.mail),
                  ),
                  placeholder: "Email",
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
                  style: TextStyle(fontSize: contextHeight * 0.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orangeAccent),
                  ),
                ),
                SizedBox(height: contextHeight * 0.2),
                CupertinoTextField(
                  controller: _passwordController,
                  prefix: Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                    child: Icon(CupertinoIcons.padlock),
                  ),
                  placeholder: "Password",
                  obscureText: true,
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
                  style: TextStyle(fontSize: contextHeight * 0.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orangeAccent),
                  ),
                ),
                SizedBox(height: contextHeight * 0.5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.15),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
