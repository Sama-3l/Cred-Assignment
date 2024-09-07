import 'package:cred/business_logic/cubits/GridListChangeCubit/grid_list_change_cubit_cubit.dart';
import 'package:cred/business_logic/cubits/SelectItemCubit/select_item_cubit.dart';
import 'package:cred/data/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesGridItem extends StatefulWidget {
  const CategoriesGridItem({super.key, required this.item, required this.duration, required this.size});

  final Item item;
  final Duration duration;
  final double size;

  @override
  State<CategoriesGridItem> createState() => _CategoriesGridItemState();
}

class _CategoriesGridItemState extends State<CategoriesGridItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<SelectItemCubit>(context).onSelectedItemChange(widget.item);
        Navigator.of(context).pop();
      },
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 73, 73, 73), width: 0.05)),
                child: Center(
                  child: SvgPicture.string(
                    widget.item.icon,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              // RENDERS LIST DATA IF LIST LAYOUT IS SELECTED
              BlocProvider.of<GridListChangeCubit>(context).showListData
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                widget.item.name,
                                style: Theme.of(context).primaryTextTheme.labelSmall,
                              ),
                            ),
                            Text(
                              widget.item.decription,
                              style: Theme.of(context).primaryTextTheme.bodySmall,
                              softWrap: true,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          // ITEM NAME BELOW THE ICON DISAPPEARS SLOWLY AS GRID LAYOUT CHANGES TO LIST
          AnimatedOpacity(
              duration: widget.duration,
              onEnd: () {
                BlocProvider.of<GridListChangeCubit>(context).onDisappearItemLabel();
              },
              opacity: BlocProvider.of<GridListChangeCubit>(context).isGrid ? 1 : 0,
              child: !BlocProvider.of<GridListChangeCubit>(context).disappearItemLabel
                  ? Text(
                      widget.item.name,
                      style: Theme.of(context).primaryTextTheme.titleSmall,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    )
                  : const SizedBox.shrink())
        ],
      ),
    );
  }
}
