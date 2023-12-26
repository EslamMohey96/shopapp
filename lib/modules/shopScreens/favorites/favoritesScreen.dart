import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class favoritesScreen extends StatelessWidget {
  late shopCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit = shopCubit.get(context);
        return cubit.is_favList == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : 
        Scaffold(
            body: Container(
          color: Colors.grey,
          child: Container(
            color: Colors.white,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            width: 100,
                            height: 100,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Image(
                                  image: NetworkImage(
                                    cubit.isFavorites.data.dataF[index].product.image
                                    ),
                                  width: 120,
                                  height: 120,
                                ),
                                if (cubit.home_model.data.products[index]
                                        .discount !=
                                    0)
                                  Container(
                                    color: Colors.red,
                                    child: Text(
                                      "Discount ${cubit.isFavorites.data.dataF[index].product.discount}%",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    '${cubit.isFavorites.data.dataF[index].product.name}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14, height: 1.1),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      sizeBoxW(7),
                                      Text(
                                        '${cubit.isFavorites.data.dataF[index].product.price}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.red),
                                      ),
                                      sizeBoxW(7),
                                      if (cubit.isFavorites.data.dataF[index].product
                                              .discount !=
                                          0)
                                        Text(
                                          '${cubit.isFavorites.data.dataF[index].product.oldPrice}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      Spacer(),
                                      IconButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          cubit.changeFavoritesData(cubit
                                              .home_model
                                              .data
                                              .products[index]
                                              .id);
                                          cubit.IsFavoritesData();
                                        },
                                        icon: Icon(Icons.favorite),
                                      ),
                                    ],
                                  ),
                                  sizeBoxH(10),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => Container(
                      color: Colors.grey,
                      height: 1,
                    ),
                itemCount: cubit.isFavorites.data.dataF.length,
          ),
        )));
      },
    );
  }
}
