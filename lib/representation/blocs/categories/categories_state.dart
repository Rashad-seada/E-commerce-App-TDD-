part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}


class CategoriesHasData extends CategoriesState {
  static late int response;
  CategoriesHasData(int categoriesEntity){
    response = categoriesEntity;
  }
}

class CategoriesHasError extends CategoriesState {}

