import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/modules/login&register/login.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
        statusBarBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarBrightness,
        statusBarIconBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarIconBrightness,
      ),
    );
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lottie/movie_splash.json'),
      splashIconSize: 250,
      backgroundColor: Theme.of(context).primaryColor,
      duration: 2500,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: const Login(),
    );
  }
}
