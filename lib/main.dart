import 'package:cred/business_logic/cubits/GridListChangeCubit/grid_list_change_cubit_cubit.dart';
import 'package:cred/business_logic/cubits/SelectItemCubit/select_item_cubit.dart';
import 'package:cred/constants/theme.dart';
import 'package:cred/data/items.dart';
import 'package:cred/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // CUBIT UPDATES THE SELECTED ITEM CHOSEN BY USER
        BlocProvider(
          create: (context) => SelectItemCubit(selectedItem: Item(name: "", decription: "", icon: "")),
        ),
        // CUBIT TO TRIGGER GRID TO LIST TRANSITION
        BlocProvider(
          create: (context) => GridListChangeCubit(isGrid: true, disappearItemLabel: false, showListData: false),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
