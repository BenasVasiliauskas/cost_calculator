import '/pages/categories_screen.dart';
import 'package:flutter/material.dart';

import '../pages/deck_screen.dart';

class CustomDrawer extends StatelessWidget {
  final bool languageEnglish;
  final Function(bool) onLanguageChanged;

  CustomDrawer(
      {required this.languageEnglish, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 96,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: languageEnglish == true
                  ? Text('Category navigation')
                  : Text('Kategori navigering'),
            ),
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Interior walls')
                : Text('Innvendige vegger'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return CategoriesScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Exterior walls')
                : Text('Yttervegger'),
            onTap: () {},
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Windows and exterior doors')
                : Text('Vinduer og ytterdører'),
            onTap: () {},
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Interior doors')
                : Text('Innerdører'),
            onTap: () {},
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Parquet and laminate')
                : Text('Parkett og laminat'),
            onTap: () {},
          ),
          ListTile(
            title: languageEnglish == true ? Text('Kitchen') : Text('Kjøkken'),
            onTap: () {},
          ),
          ListTile(
            title: languageEnglish == true ? Text('Budget') : Text('Budsjett'),
            onTap: () {},
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Language options')
                : Text('Språkvalg'),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      child: languageEnglish == false
                          ? Text('Norsk')
                          : Text('Norwegian'),
                    ),
                    Switch(
                      value: languageEnglish,
                      onChanged: onLanguageChanged,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      child: languageEnglish == false
                          ? Text('Engelsk')
                          : Text('English'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
