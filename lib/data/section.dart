// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cred/data/items.dart';

class Section {
  String title;
  List<Item> items;

  Section({required this.title, required this.items});

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      title: map["template_properties"]["header"]['title'] as String,
      items: List<Item>.from(
        (map["template_properties"]['items'] as List).map<Item>(
          (x) => Item.fromMap(x["display_data"] as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory Section.fromJson(String source) => Section.fromMap(json.decode(source) as Map<String, dynamic>);
}
