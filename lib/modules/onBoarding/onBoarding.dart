import 'package:flutter/material.dart';
import 'package:shop_app/models/boardingModel.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatelessWidget {

  PageController onBoardingController = PageController();
  

  @override
  Widget build(BuildContext context) {
    List<boardingModel> boarding = [
    boardingModel(
      image: 'assets/images/onBoard1.jpg',
      title:onBoardingCubit.get(context).langMode ?
       "Welcome to our store!":
        "مرحبا بكم في متجرنا!",
    ),
    boardingModel(
      image: 'assets/images/onBoard2.jpg',
      title: onBoardingCubit.get(context).langMode ?
      "Discover our products":
      "اكتشف منتجاتنا",
    ),
    boardingModel(
      image: 'assets/images/onBoard3.jpg',
      title: onBoardingCubit.get(context).langMode ?
      "Find what you need":
      "اعثر على ما تحتاجه",
    ),
  ];
    return Directionality(
      textDirection: onBoardingCubit.get(context).langMode ? TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
      appBar: AppBar(        
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size(70, 30),
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 15,
              ),
            ),
            onPressed: () {
              cacheHelper
                .setData(
              key: 'onBoarding',
              value: true,
            ).then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => logInScreen(),
                ),
                (route) => false,
              ));
              
            },
           
            child: onBoardingCubit.get(context).langMode ?
            Text(               
              ("Skip")             
            )
            :Text(               
              "تخطي",
              textDirection:TextDirection.rtl,
            ),
          ),
          sizeBoxW(10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView.builder(
                // scrollDirection: Axis.horizontal,
                controller: onBoardingController,
                itemBuilder: (context, index) =>
                    boardingItem(borading: boarding[index],context: context),
                itemCount: boarding.length,
                onPageChanged: (index) =>
                    onBoardingCubit.get(context).changeIndex(i: index),
              ),
            ),
            sizeBoxH(40),
            Expanded(
              flex: 1,
              child: Row(
                // : ,
                children: [
                  SmoothPageIndicator(
                      controller: onBoardingController,
                      count: boarding.length,
                      effect: CustomizableEffect(
                        activeDotDecoration: DotDecoration(
                          width: 32,
                          height: 12,
                          color: Colors.red,
                          rotationAngle: 180,
                          verticalOffset: -10,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        dotDecoration: DotDecoration(
                          width: 24,
                          height: 12,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        spacing: 6.0,
                      ),
                      onDotClicked: (index) {
                        onBoardingController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      }),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (onBoardingCubit.get(context).index == boarding.length - 1) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => logInScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        onBoardingController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )
,
      ) ;
       }

  Widget boardingItem({required boardingModel borading,context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: Center(
            child: Image(
              image: AssetImage(borading.image),
            ),
          ),
        ),
        sizeBoxH(30),
        Expanded(
          flex: 2,
          child: onBoardingCubit.get(context).langMode ?
             Text(
            '${borading.title}',
            style: TextStyle(
              
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
            : Text(
            '${borading.title}',
            style: TextStyle(
              
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
