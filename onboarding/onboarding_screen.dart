import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;
import 'components/animated_btn.dart';
import 'components/sign_in_dialog.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 420,
                      child: Column(
                        children: [
                          Text(
                            "✩Welcome✩\nWe are\n PoopSee!",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "하이루!! 모두모두 혼또니 반가워!! Hello 들어와줘서 아리가또야.~",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text("2024 SKT FLY AI 5기 패기 3팀 골든 리트리버"),
                    )
                  ],
                ),
              ),
            ),
          ),

          // 여기에 CircularButton - Floating Animation Button (FAB) 맹글기
          Positioned(
            right: 30,
            bottom: 30,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                  child: Container(
                    color: Colors.transparent,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(
                      getRadiansFromDegree(270), degOneTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.blue.withOpacity(0.7),  // 투명도 70%
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.person,  // 마이페이지
                        color: Colors.white,
                      ),
                      onClick: () {
                        print('MyPage');
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(
                      getRadiansFromDegree(225), degTwoTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.black.withOpacity(0.7), // 투명도 70%
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      onClick: () {
                        print('Camera');
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(
                      getRadiansFromDegree(180), degThreeTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.pinkAccent.withOpacity(0.7),  // 투명도 70%
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                      ),
                      onClick: () {
                        print('Calendar');
                      },
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.orange.withOpacity(0.9),  // 투명도 90%
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onClick: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  const CircularButton({
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: () => onClick(),
      ),
    );
  }
}
