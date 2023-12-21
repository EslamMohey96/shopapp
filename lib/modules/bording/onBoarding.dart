import 'package:flutter/material.dart';
import 'package:shop_app/models/boardingModel.dart';
import 'package:shop_app/modules/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatelessWidget {
  List<boardingModel> boarding = [
    boardingModel(
      image: 'assets/images/onBoard1.jpg',
      title: "title",
      body: "body",
    ),
    boardingModel(
      image: 'assets/images/onBoard2.jpg',
      title: "title",
      body: "body",
    ),
    boardingModel(
      image: 'assets/images/onBoard3.jpg',
      title: "title",
      body: "body",
    ),
  ];

  PageController onBoardingController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => logInScreen(),
                ),
                (route) => false,
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView.builder(
                controller: onBoardingController,
                itemBuilder: (context, index) =>
                    boardingItem(borading: boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index) =>
                    shopCubit.get(context).changeIndex(i: index),
              ),
            ),
            sizeBoxH(40),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SmoothPageIndicator(
                      controller: onBoardingController,
                      count: boarding.length,
                      effect: CustomizableEffect(
                        activeDotDecoration: DotDecoration(
                          width: 32,
                          height: 12,
                          color: Colors.teal,
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
                      if (shopCubit.get(context).index == boarding.length - 1) {
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
    );
  }

  Widget boardingItem({required boardingModel borading}) {
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
          child: Text(
            '${borading.title}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        sizeBoxH(15),
        Expanded(
          flex: 1,
          child: Text(
            '${borading.body}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
