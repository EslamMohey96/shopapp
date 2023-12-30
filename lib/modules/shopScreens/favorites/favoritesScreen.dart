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
              : cubit.is_favList == 2?
              Center(
                  child: Text(
                    "No Favorite Product yet"
                  ),
                ):
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
                                    cubit.isFavList[index].product!.image
                                    ),
                                  width: 120,
                                  height: 120,
                                ),
                                if (cubit.isFavList[index]
                                        .product?.discount !=
                                    0)
                                  Container(
                                    color: Colors.red,
                                    child: Text(
                                      "Discount ${cubit.isFavList[index]
                                        .product?.discount}%",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cubit.isFavList[index]
                                        .product?.name}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14, height: 1.1),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      sizeBoxW(7),
                                      Text(
                                        '${cubit.isFavList[index]
                                        .product?.price}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.red),
                                      ),
                                      sizeBoxW(7),
                                      if (cubit.isFavList[index]
                                        .product
                                              ?.discount !=
                                          0)
                                        Text(
                                          '${cubit.isFavList[index]
                                        .product?.oldPrice}',
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
                                              .isFavList[index]
                                        .product
                                              ?.id);
                                          
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
                itemCount: cubit.isFavList.length,
          ),
        )));
      },
    );
  }
}
