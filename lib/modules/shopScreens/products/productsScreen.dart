import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class productsScreen extends StatelessWidget {
  late shopCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit = shopCubit.get(context);
        return Scaffold(
          body: cubit.homeModelDone == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  color: Colors.grey[300],
                  child: productsBuilder(),
                ),
        );
      },
    );
  }

  Widget productsBuilder() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: cubit.home_model.data.banners
                .map(
                  (e) => Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 20,
              right: 10,
              left: 10,
            ),
            width: double.infinity,
            color: Colors.white,
            child: Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 5,
              right: 10,
              left: 10,
            ),
            color: Colors.white,
            height: 100,
            child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                      '${cubit.categories_model.data.dataM[index].image}',
                    ),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.8),
                    width: 100,
                    child: Text(
                      '${cubit.categories_model.data.dataM[index].name}',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => sizeBoxW(5),
              itemCount: cubit.categories_model.data.dataM.length,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 40,
              right: 10,
              left: 10,
            ),
            width: double.infinity,
            color: Colors.white,
            child: Text(
              'New Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          sizeBoxH(2),
          Container(
            child: GridView.count(
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 1 / 1.5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(
                cubit.home_model.data.products.length,
                (index) => Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Image(
                            image: NetworkImage(
                                cubit.home_model.data.products[index].image),
                            width: double.infinity,
                            height: 200,
                          ),
                          if (cubit.home_model.data.products[index].discount !=
                              0)
                            Container(
                              color: Colors.red,
                              child: Text(
                                "Discount ${cubit.home_model.data.products[index].discount}%",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            )
                        ],
                      ),
                      sizeBoxH(7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '${cubit.home_model.data.products[index].name}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, height: 1.1),
                        ),
                      ),
                      sizeBoxH(7),
                      Row(
                        children: [
                          sizeBoxW(7),
                          Text(
                            '${cubit.home_model.data.products[index].price}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                          sizeBoxW(7),
                          if (cubit.home_model.data.products[index].discount !=
                              0)
                            Text(
                              '${cubit.home_model.data.products[index].old_price}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          Spacer(),
                          IconButton(
                              color: cubit.favList[
                                      cubit.home_model.data.products[index].id]!
                                  ? Colors.red
                                  : Colors.grey,
                              onPressed: () {
                                cubit.changeFavoritesData(
                                    cubit.home_model.data.products[index].id);
                                cubit.IsFavoritesData();
                              },
                              icon: Icon(Icons.favorite))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
