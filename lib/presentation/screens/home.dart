import 'dart:io' show Platform;

import 'package:cred/business_logic/cubits/SelectItemCubit/select_item_cubit.dart';
import 'package:cred/data/section.dart';
import 'package:cred/functions/methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cred/presentation/widgets/home_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Methods func = Methods(); // ACCESS FUNCTIONS FROM THE METHODS CLASS
  List<Section> allSections = []; // STORE SECTION DATA AFTER NETWORK CALL

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    BlocProvider.of<SelectItemCubit>(context).onLoadingData(); // LOADING STATE
    final data = await func.fetchDataNetworkCall();
    allSections = data.$2;
    BlocProvider.of<SelectItemCubit>(context).onSelectedItemChange(data.$1); // UPDATE SELECTED ITEM
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, bottom: 32.0, right: 32.0),
            child: BlocBuilder<SelectItemCubit, SelectItemState>(
              builder: (context, state) {
                if (state is LoadingDataState || state is SelectItemInitial) {
                  return Center(
                      child: Platform.isIOS
                          ? CupertinoActivityIndicator(
                              color: Theme.of(context).indicatorColor,
                            )
                          : CircularProgressIndicator(color: Theme.of(context).indicatorColor));
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 64.0),
                      child: SvgPicture.string(
                        BlocProvider.of<SelectItemCubit>(context).selectedItem.icon,
                        height: 96,
                      ),
                    ),
                    Text(
                      "CRED ${BlocProvider.of<SelectItemCubit>(context).selectedItem.name}",
                      style: Theme.of(context).primaryTextTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 48),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          BlocProvider.of<SelectItemCubit>(context).selectedItem.decription,
                          softWrap: true,
                          style: Theme.of(context).primaryTextTheme.displayMedium,
                        ),
                      ),
                    ),
                    HomePageButton(
                      buttonLabel: "Go to category",
                      sections: allSections,
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
