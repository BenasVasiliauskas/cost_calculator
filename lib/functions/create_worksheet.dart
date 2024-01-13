import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:collection/collection.dart';

Future<void> generateExcelDocument(
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) async {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;

  //Create a new Excel Document.
  final Workbook workbook = Workbook();
  //Access the sheets via index.
  final Worksheet worksheet = workbook.worksheets[0];

  final Range range = worksheet.getRangeByName('A1:K1');
  final Range range1 = worksheet.getRangeByName('A1:A14');
  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }

  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  final List<int> bytes = workbook.saveAsStream();
  File('Output.xlsx').writeAsBytes(bytes);
  workbook.dispose();
}
