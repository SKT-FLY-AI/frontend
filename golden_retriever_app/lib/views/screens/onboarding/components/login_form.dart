// lib/views/screens/onboarding/components/login_form.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_retriever_app/views/screens/signup_screen.dart';
import 'package:rive/rive.dart';
import '../../entryPoint/entry_point.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  late SMITrigger confetti;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, 'State Machine 1');

    if (controller == null) return; // controller == null일 경우 오류 방지.....ㅜ.ㅜ
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

  void signIn(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // 이메일이나 비번이 비어있으면 오류 애니메이션 실행
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EntryPoint(),
                  ),
                );
              });
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.height * 0.1;

    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
            child: Column(
            children: [
              /// 이메일 입력창
              CupertinoTextField(
                controller: emailController,
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                  // child: SvgPicture.asset("assets/icons/email_fill.svg"),
                  child: Icon(CupertinoIcons.mail),
                ),
                placeholder: "Email",
                padding: EdgeInsets.symmetric(
                    vertical: contextHeight * 0.2,
                    horizontal: contextWidth * 0.1
                ),
                style: TextStyle(fontSize: contextHeight * 0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orangeAccent),
                ),
              ),

              SizedBox(height: contextHeight * 0.2),

              /// 패스워드 입력창
              CupertinoTextField(
                controller: passwordController,
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
                  // child: SvgPicture.asset("assets/icons/lock_fill.svg"),
                  child: Icon(CupertinoIcons.padlock),
                ),
                placeholder: "Password",
                obscureText: true,
                padding: EdgeInsets.symmetric(
                    vertical: contextHeight * 0.2,
                    horizontal: contextWidth * 0.1
                ),
                style: TextStyle(fontSize: contextHeight * 0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orangeAccent),
                ),
              ),

              SizedBox(height: contextHeight * 0.5),

              /// 로그인 버튼
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
                  onPressed: () {
                    signIn(context);
                  },
                ),
              ),
            ],
          ),)
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