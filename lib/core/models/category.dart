import 'package:flutter/material.dart';

class Category {
  int id;
  String name;
  String photoUrl;
  Color color;

  Category({required this.id, required this.name, required this.photoUrl, this.color = Colors.green});
}