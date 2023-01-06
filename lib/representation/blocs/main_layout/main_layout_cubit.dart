import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutHome());

  PageController controller = PageController();

  int currentIndex = 0;

  changePage(int index){
    currentIndex = index;
    emit(states[index]);
  }

  List states = [
    MainLayoutHome(),
    MainLayoutCatagories(),
    MainLayoutCart(),
    MainLayoutSettings(),
  ];

}
