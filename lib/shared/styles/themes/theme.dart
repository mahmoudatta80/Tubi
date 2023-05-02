import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/shared/styles/colors/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Bold',
    backgroundColor: darkDefaultColor,
    primaryColor: darkDefaultColor,
    primaryColorLight: lightDefaultColor,
    highlightColor: Colors.black45,

    appBarTheme: AppBarTheme(
      backgroundColor: darkDefaultColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkDefaultColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: lightDefaultColor,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkDefaultColor,
      elevation: 0,
      selectedItemColor: lightDefaultColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black45,
      showUnselectedLabels: false,
    ),

    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        color: lightDefaultColor,
      ),
      headline2: TextStyle(
        fontSize: 15,
        color: lightDefaultColor,
      ),
      headline3: TextStyle(
        color: lightDefaultColor.withOpacity(.7),
        fontSize: 15,
      ),
      headline4: TextStyle(
        color: lightDefaultColor.withOpacity(.7),
        fontSize: 12,
      ),
      headline5: TextStyle(
        color: lightDefaultColor,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: lightDefaultColor,
        fontSize: 35,
      ),
      bodyText2: TextStyle(
        color: lightDefaultColor,
      ),
    ),

    iconTheme: IconThemeData(
      color: lightDefaultColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Bold',
    backgroundColor: lightDefaultColor,
    primaryColor: lightDefaultColor,
    primaryColorLight: darkDefaultColor,
    highlightColor: Colors.white38,

    appBarTheme: AppBarTheme(
      backgroundColor: lightDefaultColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightDefaultColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: darkDefaultColor,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightDefaultColor,
      elevation: 0,
      selectedItemColor: darkDefaultColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white38,
      showUnselectedLabels: false,
    ),

    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        color: darkDefaultColor,
      ),
      headline2: TextStyle(
        fontSize: 15,
        color: darkDefaultColor,
      ),
      headline3: TextStyle(
        color: darkDefaultColor.withOpacity(.6),
        fontSize: 15
      ),
      headline4: TextStyle(
        color: darkDefaultColor.withOpacity(.7),
        fontSize: 12,
      ),
      headline5: TextStyle(
        color: darkDefaultColor,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: darkDefaultColor,
        fontSize: 35,
      ),
      bodyText2: TextStyle(
        color: darkDefaultColor,
      ),
    ),

    iconTheme: IconThemeData(
      color: darkDefaultColor,
    ),
  );
}
