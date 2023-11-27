import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';

import '/category_item.dart';
import 'package:flutter/material.dart';
import 'deck_screen.dart';
import '../constants/language.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return DeckScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: languageEnglish == true ? Text('Test') : Text('Test norw'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return DeckScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: languageEnglish == true
                  ? Text("Language options")
                  : Text("Språkvalg"),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                        child: languageEnglish == false
                            ? Text("Norsk")
                            : Text("Norwegian"),
                      ),
                      Switch(
                        value: languageEnglish,
                        onChanged: (value) {
                          setState(() {
                            languageEnglish = value;
                          });
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: languageEnglish == false
                              ? Text("Engelsk")
                              : Text("English")),
                    ],
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
      body: languageEnglish == true
          ? GridView.count(
              padding: const EdgeInsets.all(25),
              children: data
                  .map(
                    (catData) => CategoryItem(
                      catData.name,
                      catData.description,
                      catData.unit,
                      catData.quantity,
                      catData.materialQuantity,
                      catData.laborHours1,
                      catData.laborHours2,
                      catData.laborCost,
                      catData.material1,
                      catData.material2,
                      catData.totalPrice,
                      catData.color,
                    ),
                  )
                  .toList(),
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 2,
            )
          : GridView.count(
              padding: const EdgeInsets.all(25),
              children: norwData
                  .map(
                    (catData) => CategoryItem(
                      catData.name,
                      catData.description,
                      catData.unit,
                      catData.quantity,
                      catData.materialQuantity,
                      catData.laborHours1,
                      catData.laborHours2,
                      catData.laborCost,
                      catData.material1,
                      catData.material2,
                      catData.totalPrice,
                      catData.color,
                    ),
                  )
                  .toList(),
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 2,
            ),
    );
  }
}
