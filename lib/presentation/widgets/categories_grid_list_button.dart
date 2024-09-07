import 'package:cred/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridListButton extends StatelessWidget {
  const GridListButton({super.key, required this.isGrid});

  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isGrid
          ? SvgPicture.string(
              key: const ValueKey<int>(0),
              switchGrid,
              fit: BoxFit.fitWidth,
              height: 24,
            )
          : SvgPicture.string(
              key: const ValueKey<int>(1),
              switchList,
              fit: BoxFit.fitWidth,
              height: 24,
            ),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
