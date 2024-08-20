import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'sign_in_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void signUp(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // 이메일이나 패스워드가 비어있으면 오류 애니메이션 실행
      error.fire();
      Future.delayed(
        const Duration(seconds: 2),
            () {
          setState(() {
            isShowLoading = false;
          });
          reset.fire();
        },
      );
    } else {
      // 입력이 모두 유효한 경우
      setState(() {
        isShowConfetti = true;
        isShowLoading = true;
      });
      Future.delayed(
        const Duration(seconds: 1),
            () {
          success.fire();
          Future.delayed(
            const Duration(seconds: 2),
                () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pop(context); // 로그인 화면으로 돌아가기
              });
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 1) SignUp - Nickname 입력
              CupertinoTextField(
                controller: emailController,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/person_fill.svg"),
                ),
                placeholder: "Nickname",
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                style: const TextStyle(fontSize: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orangeAccent),
                ),
              ),

              // 2) SignUp - Email 입력
              CupertinoTextField(
                controller: emailController,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/email_fill.svg"),
                ),
                placeholder: "Email",
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                style: const TextStyle(fontSize: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orangeAccent),
                ),
              ),

              // 3) SignUp - Password 입력
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: passwordController,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/lock_fill.svg"),
                ),
                placeholder: "Password",
                obscureText: true,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                style: const TextStyle(fontSize: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orangeAccent),
                ),
              ),

              // 4) SignUp - 회원가입 버튼
              const SizedBox(height: 20),
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text(
                    "Sign Up!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    signUp(context);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
          if (isShowLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (isShowConfetti)
            Positioned.fill(
              child: RiveAnimation.asset(
                "assets/RiveAssets/confetti.riv",
                onInit: _onConfettiRiveInit,
                fit: BoxFit.cover,
              ),
            ),
        ],
    );
  }
}