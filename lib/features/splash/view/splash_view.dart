import 'package:coffe_shop/core/theme/cubit/theme_cubit.dart';
import 'package:coffe_shop/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/custom_button.dart';
import '../view_model/cubit/splash_cubit.dart';
import 'widgets/fade_animation.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textSlide;
  late Animation<double> _fadeIn;
  late Animation<double> _imageScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeIn = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 1), // from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _imageScale = Tween<double>(
      begin: 1.2,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    BlocProvider.of<SplashCubit>(context).loadSplash();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          /// Background image with a zoom-in animation
          AnimatedBuilder(
            animation: _imageScale,
            builder: (context, child) {
              return Transform.scale(scale: _imageScale.value, child: child);
            },
            child: Image.asset(
              'assets/images/coffee6.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FadeInWidget(
              // opacity: _fadeIn,
              delay: 500,
              child: SlideTransition(
                position: _textSlide,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.splashString1,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                    Text(
                      AppStrings.splashString2,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(40),
                    FadeInWidget(
                      delay: 3200,
                      child: CustomButton(
                        size: Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.width * 0.15,
                        ),
                        child: Text(
                          AppStrings.getStarted,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        onPressed: () {
                          // Navigate to the next screen
                          context.go('/home');
                          // print(Theme.of(context).primaryColor.toString());
                          // // Output: Brightness.light or Brightness.dark
                          // BlocProvider.of<ThemeCubit>(context).toggleTheme();
                          // print(Theme.of(context).brightness);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
