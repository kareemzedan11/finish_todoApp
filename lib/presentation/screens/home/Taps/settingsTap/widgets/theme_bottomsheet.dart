import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatelessWidget {
  final Function(String) onThemeSelected;

  ThemeBottomSheet({required this.onThemeSelected});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDarkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Light',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              onThemeSelected('Light');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Dark',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              onThemeSelected('Dark');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
