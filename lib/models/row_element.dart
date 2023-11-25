import 'package:flutter/material.dart';

class RowElement {
  final String id;
  final String title;
  final Color color;

  const RowElement({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
