import 'package:flutter/material.dart';
import 'package:todo/core/utiles/colors_Manager.dart';

class MyThemeData {
  static bool isDarkEnabled = false;
  static const Color lightPrimaryColor = ColorsManager.LightAppColor;
  static const Color dividercolor = ColorsManager.BlueColor;

  static const Color darkPrimaryColor = ColorsManager.DarkAppColor;
  static const Color darkSecondaryColor = ColorsManager.BlueColor;
  static const Color scaffoldBackgroundColor = ColorsManager.LightAppColor;
  static const Color lightAppBarIconColor = Colors.black;
  static const Color darkAppBarIconColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(

    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white,
    cancelButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
    confirmButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)
    
    )),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
       
      confirmButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
      cancelButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
    ),
    primaryColor: lightPrimaryColor,
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(color: Colors.white),
      menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: ColorsManager.BlueColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,
      ),
    ),
    listTileTheme: ListTileThemeData(textColor: Colors.black, tileColor: Colors.black),
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.black,
      selectedItemColor: ColorsManager.BlueColor,
      selectedIconTheme: IconThemeData(size: 40),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightPrimaryColor,
      primary: lightPrimaryColor,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      background: lightPrimaryColor,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(dividercolor)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: dividercolor),
    dividerColor: dividercolor,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: darkSecondaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold,
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.black,
      confirmButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
      cancelButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: dividercolor),
    cardColor: dividercolor,
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF141922)),
    scaffoldBackgroundColor: darkPrimaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimaryColor,
      primary: darkPrimaryColor,
      secondary: darkPrimaryColor,
      background: darkPrimaryColor,
      brightness: Brightness.dark, // Ensure brightness is here
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(dividercolor)),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFF141922)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: darkSecondaryColor,
      selectedIconTheme: IconThemeData(size: 40),
    ),
    dividerColor: darkSecondaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white), // Label text color for dark theme
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.black,
        cancelButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
        confirmButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)

        )),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
    ),
  );
}
