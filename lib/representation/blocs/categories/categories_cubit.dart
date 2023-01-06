import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit getInstance() => CategoriesCubit();

  Future getCategories() async {
      emit(CategoriesLoading());
      print('CategoriesLoading');
      String path = 'https://fakestoreapi.com/products/categories';
      Dio http = Dio();
      await http.get(path).then((value) => emit(CategoriesHasData(1)));
  }
}
