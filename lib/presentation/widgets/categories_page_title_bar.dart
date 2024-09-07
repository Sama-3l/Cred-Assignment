import 'package:cred/assets/icons.dart';
import 'package:cred/business_logic/cubits/GridListChangeCubit/grid_list_change_cubit_cubit.dart';
import 'package:cred/presentation/widgets/categories_grid_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({super.key});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GridListChangeCubit, GridListChangeState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "CRED",
              style: Theme.of(context).primaryTextTheme.displaySmall,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                BlocProvider.of<GridListChangeCubit>(context).onChangeGridList();
              },
              child: GridListButton(
                isGrid: BlocProvider.of<GridListChangeCubit>(context).isGrid,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).indicatorColor)),
                child: Center(
                    child: SvgPicture.string(
                  dropDown,
                  height: 8,
                  fit: BoxFit.fitWidth,
                )),
              ),
            ),
          ],
        );
      },
    );
  }
}
