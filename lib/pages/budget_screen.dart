import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../constants/language.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Screen'),
      ),
      drawer: CustomDrawer(
        languageEnglish: languageEnglish,
        onLanguageChanged: (bool) {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Variable 1: $budgetSum1'),
            Text('Variable 2: $budgetSum2'),
            Text('Variable 3: $budgetSum3'),
            Text('Variable 4: $budgetSum4'),
            Text('Variable 5: $budgetSum5'),
            Text('Variable 6: $budgetSum6'),
          ],
        ),
      ),
    );
  }
}
