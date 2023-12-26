import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class categoriesScreen extends StatelessWidget {
  late shopCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit = shopCubit.get(context);
        return Scaffold(
          body:cubit.categoriesModelDone==0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                itemBuilder: (context, index) =>buildCatItem(index), 
                separatorBuilder:(context, index) => sizeBoxH(20), 
                itemCount: cubit.categories_model.data.dataM.length,
                ),
        );
      },
    );
  }

  Widget buildCatItem(index){
    return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image(
                      image:NetworkImage(
                        '${cubit.categories_model.data.dataM[index].image}'
                      ),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    sizeBoxW(20),
                    Text(
                      '${cubit.categories_model.data.dataM[index].name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                  
                ),
              );

  }
}
