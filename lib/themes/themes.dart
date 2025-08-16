import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,
  primaryColor: Colors.teal[700],
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal[700],
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.teal[700],
    unselectedItemColor: Colors.grey,
  ),


  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white,
  ),


  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.teal[700],
    foregroundColor: Colors.white,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal[700],
      foregroundColor: Colors.white,
    ),
  ),

);

final ThemeData darkTheme = ThemeData(

  brightness: Brightness.dark,
  primaryColor: Colors.grey[700],
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.grey,

  appBarTheme: AppBarTheme(
    color: Colors.grey[700],
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[700],
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey[700],
    scrimColor: Colors.grey[900],
  ),

  listTileTheme: ListTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey[700],
    foregroundColor: Colors.white,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[700],
      foregroundColor: Colors.white,
    ),
  ),
);


ThemeData myLightTheme(){
  return lightTheme;
}
ThemeData myDarkTheme(){
  return darkTheme;
}