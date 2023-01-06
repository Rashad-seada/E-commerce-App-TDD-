import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit Instanse = HomeCubit();

  List ads = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/shoes-sale-bannuer-design-template-38d8c87b5b44afb4906d2d55743a98ae_screen.jpg?ts=1616352652.png',
    'https://www.fotor.com/blog/wp-content/uploads/2019/07/3-solid-background.png',
    'https://adsterra.com/blog/wp-content/uploads/2021/06/how-banners-make-you-money.png',
    'https://adsterra.com/blog/wp-content/uploads/2021/06/how-banners-make-you-money.png',
    'https://adsterra.com/blog/wp-content/uploads/2021/06/how-banners-make-you-money.png',
  ];

  int adPageIndex = 0;
  PageController pageController = PageController();

  SwiperController swiperController = SwiperController();

}
