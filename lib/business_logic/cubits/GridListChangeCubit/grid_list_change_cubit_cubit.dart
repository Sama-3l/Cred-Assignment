import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'grid_list_change_cubit_state.dart';

class GridListChangeCubit extends Cubit<GridListChangeState> {
  GridListChangeCubit({
    required this.isGrid,
    required this.disappearItemLabel,
    required this.showListData,
  }) : super(GridListChangeInitial());

  bool isGrid;
  bool disappearItemLabel;
  bool showListData;

  onChangeGridList() {
    isGrid = !isGrid;
    if (isGrid) {
      showListData = !isGrid;
    }
    emit(ChangeGridListState());
  }

  onDisappearItemLabel() {
    disappearItemLabel = !disappearItemLabel;
    emit(ChangeGridListState());
  }

  onShowListData() {
    showListData = !isGrid;
    emit(ChangeGridListState());
  }
}
