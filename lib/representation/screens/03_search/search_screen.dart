import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../components/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                backgroundColor: AppTheme.primClr(context),
                elevation: 5,
                titleSpacing: 0,
                title: SearchBar(),
                pinned: true,

              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 4,),

              ),

              SliverList(delegate: SliverChildListDelegate([



              ])),

            ],
          ),

        ));
  }
}
