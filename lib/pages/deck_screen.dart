import 'package:flutter/material.dart';
import 'categories_screen.dart';
import '../constants/language.dart';

class DeckScreen extends StatefulWidget {
  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                // Navigate to CategoriesScreen when Interior walls is tapped
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: languageEnglish == true ? Text('Test') : Text('Test norw'),
              onTap: () {},
            ),
            ListTile(
              title: languageEnglish == true
                  ? Text("Language options")
                  : Text("Språkvalg"),
              subtitle: Column(
                children: [
                  Switch(
                    value: languageEnglish,
                    onChanged: (value) {
                      setState(() {
                        languageEnglish = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Bygg Kalk'),
      ),
      body: Center(
        child: languageEnglish == true
            ? Text(
                'Deck screen',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : Text(
                'Deck skjerm',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ),
    );
  }
}
