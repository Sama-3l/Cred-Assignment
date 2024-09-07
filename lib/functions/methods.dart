import 'dart:convert';
import 'dart:math';

import 'package:cred/data/helper_classes.dart';
import 'package:cred/data/items.dart';
import 'package:cred/data/section.dart';
import 'package:http/http.dart' as http;

/*
  THIS METHODS CLASS HOLDS ALL FUNCTIONS REQUIRED IN THE CODE
  THAT DOESN'T RENDER ANY WIDGETS ARE PURELY FOR RUNNING
  LOGIC.
*/

class Methods {
  // NETWORK CALL FETCHES DATA AND SERIALIZES INTO SESSION AND ITEM CLASSES
  Future<
      (
        Item,
        List<Section>
      )> fetchDataNetworkCall() async {
    final response = await http.get(Uri.parse("https://api.mocklets.com/p6839/explore-cred"));
    final sections = (jsonDecode(response.body)["sections"] as List).map((x) => Section.fromMap(x));
    List<Item> allItems = [];
    for (var e in sections) {
      allItems.addAll(e.items);
    }
    Random random = new Random();
    return (
      allItems.elementAt(random.nextInt(allItems.length)), // INITIALLY A RANDOM ITEM IS CHOSEN AND RETURNED TO BE THE HOME PAGE
      sections.toList()
    );
  }

  // FUNCTION TO CALCULATE TOTAL CONTAINER HEIGHT BASED ON THE LAYOUT SELECTED
  double calculateContainerHeight(bool isGrid, int itemCount, int gridCrossAxisCount, double gridItemHeight, double listItemHeight, double gridSpacing, double listSpacing) {
    if (isGrid) {
      int rows = (itemCount / gridCrossAxisCount).ceil();
      return rows * (gridItemHeight + gridSpacing) + gridSpacing;
    } else {
      return itemCount * (listItemHeight + listSpacing) + listSpacing;
    }
  }

  PositionedItem calculateItemPosition({
    required int index,
    required bool isGrid,
    required int gridCrossAxisCount,
    required double gridItemWidth,
    required double gridItemHeight,
    required double listItemHeight,
    required double gridSpacing,
    required double listSpacing,
    required double screenWidth,
  }) {
    if (isGrid) {
      // GRID LAYOUT CALC
      int row = index ~/ gridCrossAxisCount;
      int col = index % gridCrossAxisCount;

      double x = col * (gridItemWidth + gridSpacing);
      double y = row * (gridItemHeight + gridSpacing) + gridSpacing;
      return PositionedItem(
        dx: x,
        dy: y,
        width: gridItemWidth,
        height: gridItemHeight,
      );
    } else {
      // LIST LAYOUT CALC
      double x = 0;
      double y = index * (listItemHeight + listSpacing);
      return PositionedItem(
        dx: x,
        dy: y,
        width: screenWidth,
        height: listItemHeight,
      );
    }
  }
}
