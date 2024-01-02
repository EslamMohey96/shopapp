import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class searchScreen extends StatelessWidget {
  late shopCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit = shopCubit.get(context);

        return Directionality(
          textDirection: onBoardingCubit.get(context).langMode
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  textFormField(
                      context: context,
                      controller: cubit.searchController,
                      textInputType: TextInputType.text,
                      labelText: onBoardingCubit.get(context).langMode
                          ? "Search"
                          : "بحث",
                      prefixIcon: Icons.search,
                      valid: (value) {},
                      onSubmit: (str) {
                        cubit.changeSearchData(cubit.searchController.text);
                      }),
                  sizeBoxH(40),
                  state is searchLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : state is searchSuccessState
                          ? Expanded(
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: onBoardingCubit
                                                .get(context)
                                                .lightMode
                                            ? Colors.white
                                            : Colors.black,
                                        width: 100,
                                        height: 100,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.bottomStart,
                                          children: [
                                            Image(
                                              image: NetworkImage(cubit
                                                  .search_model
                                                  .data!
                                                  .data![index]
                                                  .image),
                                              width: 120,
                                              height: 120,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          color: onBoardingCubit
                                                  .get(context)
                                                  .lightMode
                                              ? Colors.white
                                              : Colors.black,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cubit.search_model.data!.data![index].name}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14, height: 1.1),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  sizeBoxW(7),
                                                  Text(
                                                    '${cubit.search_model.data!.data![index].price}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.red),
                                                  ),
                                                  sizeBoxW(7),
                                                  Spacer(),
                                                  IconButton(
                                                      color: cubit.search_model.data!.data![index].inFavorites
                                                          ? Colors.red
                                                          : Colors.grey,
                                                      onPressed: () {
                                                        cubit
                                                            .changeFavoritesData(
                                                                cubit
                                                                    .home_model
                                                                    .data
                                                                    .products[
                                                                        index]
                                                                    .id);
                                                        cubit.IsFavoritesData();
                                                        cubit.changeSearchData(cubit.searchController.text);
                                                      },
                                                      icon:
                                                          Icon(Icons.favorite))
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
                                itemCount:
                                    cubit.search_model.data!.data!.length,
                              ),
                            )
                          : Container(
                              color: onBoardingCubit.get(context).lightMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
