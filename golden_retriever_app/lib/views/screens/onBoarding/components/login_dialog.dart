// lib/views/screens/onboarding/components/login_dialog.dart

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../signup_screen.dart';
import 'login_form.dart';

void showCustomDialog(BuildContext context, {required ValueChanged onValue}) {
  final double contextHeight = MediaQuery.of(context).size.height * 0.1;
  final double contextWidth = MediaQuery.of(context).size.width * 0.1;

  showCupertinoDialog(
    context: context,
    builder: (_) => Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: contextHeight * 1.7,
          horizontal: contextWidth * 0.6,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "✦ LOGIN PAGE ✦",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: contextHeight * 0.2, bottom: contextHeight * 0.5),
                        child: Text(
                          "우리 같이 PoopSee해용~♥",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),

                      const LoginScreen(),

                      /// OR 디바이더
                      Row(
                        children: [
                          Expanded(child: Divider(),),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: contextWidth * 0.5,
                                vertical: contextHeight * 0.5
                            ),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),

                      /// 회원가입 이동
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "아직 회원이 아니신가요?  ",
                            children: [
                              TextSpan(
                                text: "회원 가입",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ).then(onValue);
}