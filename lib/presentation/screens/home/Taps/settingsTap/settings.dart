import 'package:flutter/material.dart';
import 'package:todo/config/styles/theme/ThemeData.dart';
import 'package:todo/presentation/screens/home/Taps/settingsTap/widgets/language_bottomsheet.dart';
import 'package:todo/presentation/screens/home/Taps/settingsTap/widgets/theme_bottomsheet.dart';
import 'package:todo/core/utiles/colors_Manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/styles/notifier/Notifer.dart'; // Assuming this is where your theme and language notifiers are located

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = 'change language';
  String selectedMode = 'change mode';

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final languageNotifier = Provider.of<LanguageNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          AppLocalizations.of(context)!.settingsAppbar,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme'),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context, themeNotifier);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).dividerColor, width: 2),
              ),
              child: Text(
                selectedMode,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(AppLocalizations.of(context)!.language),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context, languageNotifier);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).dividerColor, width: 2),
              ),
              child: Text(
                selectedLanguage, // Display selected language
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// to view bottom sheet for theme
  void showThemeBottomSheet(BuildContext context, ThemeNotifier themeNotifier) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(
        onThemeSelected: (String selectedTheme) {
          setState(() {
            selectedMode = selectedTheme;
            if (selectedTheme == 'Light') {
              themeNotifier.setTheme(ThemeMode.light);
            } else {
              themeNotifier.setTheme(ThemeMode.dark);
            }
          });
        },
      ),
    );
  }

  /// to view bottom sheet for language
  void showLanguageBottomSheet(BuildContext context, LanguageNotifier languageNotifier) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(
        onLanguageSelected: (String selectedLang) {
          setState(() {
            selectedLanguage = selectedLang;
            languageNotifier.setLanguage(selectedLang == 'English' ? 'en' : 'ar');
          });
        },
      ),
    );
  }
}
