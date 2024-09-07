import 'dart:convert';

import 'package:cred/assets/icons.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Item {
  String name;
  String decription;
  String icon;

  Item({required this.name, required this.decription, required this.icon});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      decription: map['description'] as String,
      icon: categoryIcons[map['name']] as String,
    );
  }

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
