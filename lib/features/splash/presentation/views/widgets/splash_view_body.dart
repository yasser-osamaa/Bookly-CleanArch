import 'package:clean/core/utils/app_router.dart';
import 'package:clean/features/splash/presentation/views/widgets/image_with_fade_transation.dart';
import 'package:clean/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animiationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    textAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animiationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImageWithFadeTransation(fadeAnimation: fadeAnimation),
        SizedBox(height: 4),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void textAnimation() {
    animiationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 6),
      end: Offset(0, 0),
    ).animate(animiationController);

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 4.0,
    ).animate(animiationController);

    animiationController.forward();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.off(
      //   () => const HomeView(),
      //   transition: Transition.fade,
      //   duration: Duration(milliseconds: 1000),
      // );
      // context.goNamed(AppRouter.kHomeView);
      AppRouter.router.go(AppRouter.kHomeView);
    });
  }
}
