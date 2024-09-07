import 'package:cred/data/section.dart';
import 'package:cred/presentation/screens/categories.dart';

import '../../assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageButton extends StatefulWidget {
  const HomePageButton({super.key, required this.buttonLabel, required this.sections});

  final String buttonLabel;
  final List<Section> sections;

  @override
  State<HomePageButton> createState() => _HomePageButtonState();
}

class _HomePageButtonState extends State<HomePageButton> {
  Offset offset = const Offset(4, 4);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xff8A8A8A),
            offset: offset,
            blurRadius: 0,
          ),
        ]),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Categories(
                        sections: widget.sections,
                      )));
            },
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.buttonLabel,
                      style: Theme.of(context).primaryTextTheme.labelMedium,
                    ),
                  ),
                  SvgPicture.string(
                    buttonArrowForward,
                    color: Theme.of(context).primaryColor,
                    height: 8,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
