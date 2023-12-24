import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        shopCubit cubit = shopCubit.get(context);
        return Scaffold(
          body:
              // cubit.home_model==true?
              // CircularProgressIndicator() :
              productsBuilder(),
        );
      },
    );
  }

  Widget productsBuilder() {
    return Column(
      children: [
        // CarouselSlider(
        //   items: homeModel
        //       .fromJson(model)
        //       .data
        //       .banners
        //       .map(
        //         (e) => Image(
        //           image: NetworkImage('${e.image}'),
        //           width: double.infinity,
        //           fit: BoxFit.cover,
        //         ),
        //       )
        //       .toList(),
        //   options: CarouselOptions(
        //       height: 250,
        //       initialPage: 0,
        //       viewportFraction: 1,
        //       enableInfiniteScroll: true,
        //       reverse: false,
        //       autoPlay: true,
        //       autoPlayInterval: Duration(seconds: 3),
        //       autoPlayAnimationDuration: Duration(seconds: 1),
        //       autoPlayCurve: Curves.fastOutSlowIn,
        //       scrollDirection: Axis.horizontal),
        // ),
        Text(
          // "${homeModel.fromJson(model).status}",
          ''
        ),
      ],
    );
  }
}
