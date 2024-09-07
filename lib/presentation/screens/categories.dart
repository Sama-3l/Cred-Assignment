import 'package:cred/data/section.dart';
import 'package:cred/functions/widgetDecider.dart';
import 'package:cred/presentation/widgets/categories_page_title_bar.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.sections});

  final List<Section> sections;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  WidgetDecider wd = WidgetDecider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 16, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "explore",
                  style: Theme.of(context).primaryTextTheme.headlineMedium,
                ),
              ),
              const TitleBar(),
              ...wd.renderSections(widget.sections, context)
            ],
          ),
        ),
      ),
    ));
  }
}
