import 'package:flutter/material.dart';
import 'package:movie_app/modules/splash.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';
import 'package:movie_app/shared/styles/theme.dart';
import 'package:provider/provider.dart';
import 'shared/network/local/state_management/my_provider.dart';

void main() {
  DioHelper.init();

  runApp(
    ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<MyProvider>(context, listen: true).isLight
          ? CustomTheme.lightTheme
          : CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
// #1B1E26 color for background
// #121418 another color
