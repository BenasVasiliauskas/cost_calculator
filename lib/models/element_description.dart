import 'package:flutter/material.dart';

class ElementDescription {
  final String id;
  final String title;
  final Color color;
  final Map<String, List<String>> rowElements;

  const ElementDescription({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    required this.rowElements,
  });
}
