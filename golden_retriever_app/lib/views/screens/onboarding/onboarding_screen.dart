import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;
import 'components/animated_btn.dart';
import 'components/login_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late RiveAnimationController _btnAnimationController;
  late AnimationController animationController;
  late Animation degOneTranslationAnimation, degTwoTranslationAnimation, degThreeTranslationAnimation,
      degFourTranslationAnimation, degFiveTranslationAnimation;
  late Animation rotationAnimation;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    super.initState();

    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );

    // Initialize the animation controller for the circular menu buttons
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);

    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);

    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);

    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    _btnAnimationController.dispose();
    super.dispose();
  }

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: contextWidth,
            bottom: contextHeight * 1.5,
            child: Image.asset("assets/Backgrounds/Spline.png",),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: size.height,
            width: size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: contextHeight * 1.1),
                        Text(
                          "✩Welcome✩",
                          style: TextStyle(
                            fontSize: contextWidth,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            height: 1.5,
                          ),
                        ),
                        Text(
                          "We are\nPoopSee!",
                          style: TextStyle(
                            fontSize: contextWidth * 1.5,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "하이루!! 모두모두 혼또니 반가워!!\nHello 들어와줘서 아리가또야.~",
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: contextHeight,
                            left: contextWidth * 0.8,
                        ),
                        child: AnimatedBtn(
                          btnAnimationController: _btnAnimationController,
                          press: () {
                            _btnAnimationController.isActive = true;

                            Future.delayed(
                              const Duration(milliseconds: 800),
                                  () {
                                setState(() {
                                  isShowSignInDialog = true;
                                });
                                if (!context.mounted) return;
                                showCustomDialog(
                                  context,
                                  onValue: (_) {},
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2, horizontal: contextWidth * 0.5),
                        child: Text("2024 SKT FLY AI 5기 패기 3팀 골든 리트리버"),
                      ),
                      SizedBox(height: contextHeight * 0.1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
