import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';

import '/category_item.dart';
import 'package:flutter/material.dart';
import '../constants/language.dart';
import '../widgets/custom_drawer.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        languageEnglish: languageEnglish,
        onLanguageChanged: (value) {
          setState(() {
            languageEnglish = value;
          });
        },
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
