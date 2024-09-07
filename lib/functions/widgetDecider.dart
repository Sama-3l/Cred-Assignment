// ignore_for_file: file_names

import 'package:cred/business_logic/cubits/GridListChangeCubit/grid_list_change_cubit_cubit.dart';
import 'package:cred/data/section.dart';
import 'package:cred/functions/methods.dart';
import 'package:cred/presentation/widgets/categories_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
  ALL WIDGET RENDERING LOGIC IS CONTAINED WITHIN THIS
  WIDGETDECIDER CLASS.
  THE RETURN TYPE OF THESE FUNCTIONS IS ALWAYS A WIDGET
*/

class WidgetDecider {
  List<Widget> renderSections(List<Section> sections, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const int gridCrossAxisCount = 4;
    const double gridSpacing = 16;
    const double listSpacing = 10;
    const double gridItemWidth = 80;
    const double gridItemHeight = 120;
    const double listItemHeight = 100;
    const Duration animationDuration = Duration(milliseconds: 150);
    Methods func = Methods();
    List<Widget> children = [];
    for (var section in sections) {
      final int itemCount = section.items.length;
      children.add(Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 16),
        child: Text(
          section.title,
          style: Theme.of(context).primaryTextTheme.headlineSmall,
        ),
      ));
      Widget grid = BlocBuilder<GridListChangeCubit, GridListChangeState>(
        builder: (context, state) {
          return SizedBox(
            height: func.calculateContainerHeight(BlocProvider.of<GridListChangeCubit>(context).isGrid, itemCount, gridCrossAxisCount, gridItemHeight, listItemHeight, gridSpacing, listSpacing),
            child: Stack(
              children: List.generate(itemCount, (index) {
                // CALCULATE THE POSITION BASED ON THE LAYOUT SELECTED
                final position = func.calculateItemPosition(
                  index: index,
                  isGrid: BlocProvider.of<GridListChangeCubit>(context).isGrid,
                  gridCrossAxisCount: gridCrossAxisCount,
                  gridItemWidth: gridItemWidth,
                  gridItemHeight: gridItemHeight,
                  listItemHeight: listItemHeight,
                  gridSpacing: gridSpacing,
                  listSpacing: listSpacing,
                  screenWidth: screenWidth,
                );

                return AnimatedPositioned(
                  key: ValueKey<int>(index),
                  onEnd: () {
                    BlocProvider.of<GridListChangeCubit>(context).onShowListData();
                  },
                  left: position.dx,
                  top: position.dy,
                  width: position.width,
                  height: position.height,
                  duration: animationDuration,
                  curve: Curves.easeOutSine,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: CategoriesGridItem(
                      item: section.items[index],
                      duration: const Duration(milliseconds: 100),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      );
      children.add(grid);
    }
    return children;
  }
}
