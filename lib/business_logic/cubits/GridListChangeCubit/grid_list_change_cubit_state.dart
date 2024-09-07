part of 'grid_list_change_cubit_cubit.dart';

@immutable
sealed class GridListChangeState {}

final class GridListChangeInitial extends GridListChangeState {}

final class ChangeGridListState extends GridListChangeState {}
