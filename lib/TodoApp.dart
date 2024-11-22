import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/presentation/screens/Login/Login.dart';
import 'package:todo/presentation/screens/SignUp/Signup.dart';
import 'package:todo/presentation/screens/home/HomeScreen.dart';
import 'package:todo/presentation/screens/splash/Splash_Screen.dart';
import 'config/styles/notifier/Notifer.dart';
import 'config/styles/theme/ThemeData.dart';
import 'core/utiles/routes_Manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier, LanguageNotifier>(
      builder: (context, themeNotifier, languageNotifier, child) {
        return MaterialApp(
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          themeMode: themeNotifier.themeMode, // Use themeMode from the provider

          initialRoute: RoutesManager.SplashRoute, // Set initial route to splash screen
          routes: {
            RoutesManager.SplashRoute: (context) => const SplashScreen(),
            RoutesManager.HomeRoute: (context) => const Homescreen(),
            RoutesManager.login: (context) => Login(),
            RoutesManager.register: (context) => Register(),
          },
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'),
          ],
          locale: Locale(languageNotifier.language), // Set locale based on selected language
        );
      },
    );
  }
}
