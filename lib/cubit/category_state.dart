part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategorySuccessState extends CategoryState {
  final List<ProductModel> list;

  CategorySuccessState({required this.list});
}

final class CategoryLoadimgState extends CategoryState {}

final class CategoryFailedState extends CategoryState {}
