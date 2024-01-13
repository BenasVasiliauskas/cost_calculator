import 'dart:io';

import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../constants/language.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;

class BudgetScreen extends StatefulWidget {
  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Screen'),
      ),
      drawer: CustomDrawer(
        languageEnglish: languageEnglish,
        onLanguageChanged: (value) {
          setState(() {
            languageEnglish = value;
          });
        },
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
            FloatingActionButton(
                onPressed: () {
                  // Create a new Excel document.
                  final Workbook workbook = new Workbook();
                  //Accessing worksheet via index.
                  final Worksheet sheet = workbook.worksheets[0];
                  sheet.getRangeByName('A1').setText('Hello World');
                  sheet.getRangeByName('A3').setNumber(44);

                  //Add DateTime
                  sheet
                      .getRangeByName('A5')
                      .setDateTime(DateTime(2020, 12, 12, 1, 10, 20));
                  // Save the document.
                  final List<int> bytes = workbook.saveAsStream();
                  File('CreateExcel.xlsx').writeAsBytes(bytes);
                  //Dispose the workbook.

                  workbook.dispose();
                },
                child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
