import 'package:bloc/bloc.dart';
import 'package:cred/data/items.dart';
import 'package:meta/meta.dart';

part 'select_item_state.dart';

class SelectItemCubit extends Cubit<SelectItemState> {
  SelectItemCubit({required this.selectedItem}) : super(SelectItemInitial());

  Item selectedItem;

  onSelectedItemChange(Item item) {
    selectedItem = item;
    emit(NewItemSelectedState());
  }

  onLoadingData() {
    emit(LoadingDataState());
  }
}
