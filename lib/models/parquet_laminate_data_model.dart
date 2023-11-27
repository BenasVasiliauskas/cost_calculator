import 'package:flutter/material.dart';

class ParquetAndLaminateModel {
  String name;
  List description;
  List unit;
  List quantity;
  List laborHours1;
  List laborHours2;
  List laborCost;
  List material;
  List materials;
  List totalPrice;
  final Color color;

  ParquetAndLaminateModel({
    required this.name,
    required this.description,
    required this.unit,
    required this.quantity,
    required this.laborHours1,
    required this.laborHours2,
    required this.laborCost,
    required this.material,
    required this.materials,
    required this.totalPrice,
    this.color = const Color.fromARGB(255, 65, 150, 207),
  });
}
