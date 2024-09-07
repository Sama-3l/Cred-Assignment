part of 'select_item_cubit.dart';

@immutable
sealed class SelectItemState {}

final class SelectItemInitial extends SelectItemState {}

final class LoadingDataState extends SelectItemState {}

final class NewItemSelectedState extends SelectItemState {}
