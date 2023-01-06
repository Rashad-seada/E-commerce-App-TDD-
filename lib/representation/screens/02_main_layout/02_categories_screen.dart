import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../components/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(

                  children: [
                    SizedBox(height: 1.2.h,),
                    SearchBar(),

                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: AppTheme.thirdClr(context),
                              child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 10.w,
                                      height: 20.w,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: AppTheme.primClr(context),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(6),
                                            bottomRight: Radius.circular(6)),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: AppTheme.primClr(context),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),

        ));
  }
}


