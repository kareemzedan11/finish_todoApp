import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  final Function(String) onLanguageSelected;

  LanguageBottomSheet({required this.onLanguageSelected});

  @override
  Widget build(BuildContext context) {
    // Get current theme
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDarkMode ? Colors.black : Colors.white, // Set background color based on theme
      child: Column(
        children: [
          ListTile(
            title: Text(
              'English',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black, // Adjust text color based on theme
              ),
            ),
            onTap: () {
              onLanguageSelected('English');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Arabic',
              style: TextStyle(

                color: isDarkMode ? Colors.white : Colors.black, // Adjust text color based on theme
              ),
            ),
            onTap: () {
              onLanguageSelected(AppLocalizations.of(context)!.arabic);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
