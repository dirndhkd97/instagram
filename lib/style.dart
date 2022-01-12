import 'package:flutter/material.dart';

var theme = ThemeData(
  brightness: Brightness.dark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Colors.blue,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    elevation: 1,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
    actionsIconTheme: IconThemeData(color: Colors.white,),
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.white70)
  ),
);